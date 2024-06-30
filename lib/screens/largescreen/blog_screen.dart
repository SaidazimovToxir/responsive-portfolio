import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/controllers/blog_controller.dart';
import 'package:portfolio/models/blog_model.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  Map<String, List<BlogModel>> groupPostsByMonth(List<BlogModel> posts) {
    Map<String, List<BlogModel>> groupedPosts = {};
    for (var post in posts) {
      DateTime dateTime = post.publishedAt.toDate();
      String monthYear = DateFormat('MMMM yyyy').format(dateTime);
      if (groupedPosts[monthYear] == null) {
        groupedPosts[monthYear] = [];
      }
      groupedPosts[monthYear]!.add(post);
    }

    var sortedKeys = groupedPosts.keys.toList()
      ..sort(
        (a, b) => DateFormat('MMMM yyyy').parse(b).compareTo(
              DateFormat('MMMM yyyy').parse(a),
            ),
      );

    Map<String, List<BlogModel>> sortedGroupedPosts = {
      for (var k in sortedKeys) k: groupedPosts[k]!
    };

    return sortedGroupedPosts;
  }

  @override
  Widget build(BuildContext context) {
    final _blogController = context.watch<BlogController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.18),
              child: TextButton(
                onHover: (value) => false,
                onFocusChange: (value) => false,
                onPressed: () {},
                child: const Text(
                  "My blog",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double shrinkOffset = constraints.biggest.height;
                double appBarAlpha = (1 - shrinkOffset / 250).clamp(0.0, 1.0);
                Color appBarColor = Color.lerp(
                  AppColors.ebony.withOpacity(0.8),
                  AppColors.ebony,
                  appBarAlpha,
                )!;

                return Container(
                  color: appBarColor,
                  child: FlexibleSpaceBar(
                    background: Container(
                      color: appBarColor,
                      child: const Center(
                        child: Text(
                          "Blog",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            letterSpacing: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 50,
              left: size.width * 0.2,
              right: size.width * 0.2,
            ),
            sliver: StreamBuilder(
              stream: _blogController.list,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text("Ushbu Blogda hali postlar mavjud emas"),
                    ),
                  );
                }
                final blogPosts = snapshot.data!.docs
                    .map((doc) => BlogModel.fromJson(doc))
                    .toList();

                final groupedPosts = groupPostsByMonth(blogPosts);

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      String monthYear = groupedPosts.keys.elementAt(index);
                      List<BlogModel> posts = groupedPosts[monthYear]!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            monthYear,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                          ),
                          ...posts.map((post) {
                            DateTime dateTime = post.publishedAt.toDate();
                            String formattedTime =
                                DateFormat('dd MMMM, yyyy').format(dateTime);
                            return HoverableBlogPost(
                              post: post,
                              formattedTime: formattedTime,
                              onPressed: () {
                                context.go('/blogDescription', extra: post);
                              },
                            );
                          }).toList(),
                          const SizedBox(height: 50),
                        ],
                      );
                    },
                    childCount: groupedPosts.keys.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HoverableBlogPost extends StatefulWidget {
  final BlogModel post;
  final String formattedTime;
  final Function() onPressed;

  const HoverableBlogPost({
    super.key,
    required this.post,
    required this.formattedTime,
    required this.onPressed,
  });

  @override
  State<HoverableBlogPost> createState() => _HoverableBlogPostState();
}

class _HoverableBlogPostState extends State<HoverableBlogPost> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.formattedTime,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      const Gap(10.0),
                      Text(
                        widget.post.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: _isHovered
                          ? (Matrix4.identity()..translate(10, 0, 0))
                          : Matrix4.identity(),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
