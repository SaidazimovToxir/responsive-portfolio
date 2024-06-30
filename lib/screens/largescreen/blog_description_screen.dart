import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/models/blog_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogDescriptionScreen extends StatelessWidget {
  final BlogModel posts;

  const BlogDescriptionScreen({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime dateTime = posts.publishedAt.toDate();
    String formattedTime = DateFormat('dd MMMM, yyyy').format(dateTime);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.capeCod,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: size.width * 0.3,
            right: size.width * 0.3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts.title,
                style: const TextStyle(
                  fontSize: 50,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              const Gap(5.0),
              Text(
                formattedTime,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
              const Gap(30.0),
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.36),
                child: const Divider(
                  thickness: 0.5,
                ),
              ),
              const Gap(40.0),
              Text(
                posts.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                  letterSpacing: 1.5,
                  height: 1.7,
                ),
              ),
              const Gap(50.0),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Obuna bo'ling",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          height: 1.7,
                        ),
                      ),
                      const Gap(10.0),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            letterSpacing: 1.5,
                            height: 1.7,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  "Yangi maqola, va texnalogiya olamidagi barcha yangiliklarni ",
                            ),
                            TextSpan(
                              text: "@citytech_uz",
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchURL("https://t.me/citytech_uz");
                                },
                            ),
                            const TextSpan(
                              text: " telegram kanalimda topishingiz mumkin.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
