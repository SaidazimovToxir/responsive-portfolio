import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/styles.dart';
import 'package:portfolio/screens/widgets/count_container_widget.dart';
import 'package:portfolio/screens/widgets/desktop_widgets/business_card.dart';
import 'package:portfolio/screens/widgets/header_text_widget.dart';
import 'package:portfolio/screens/widgets/myservice_widgets.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Styles.gradientDecoration,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HeaderTextWidget(
                              size: size,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Social_large(size: size),
                          ],
                        ),
                        Expanded(
                            child: Container(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RotatingImageContainer(),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountWidget(
                          size: size,
                          text1: "1",
                          text2: "Years of",
                          text3: "Experience",
                        ),
                        CountWidget(
                          size: size,
                          text1: "10+",
                          text2: "Projects",
                          text3: "Completed",
                        ),
                        CountWidget(
                          size: size,
                          text1: "1.5K",
                          text2: "Happy",
                          text3: "Customers",
                        ),
                        CountWidget(
                          size: size,
                          text1: "1M",
                          text2: "Awesome",
                          text3: "Reviews",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  Container(
                    color: AppColors.ebony,
                    padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                    child: Column(
                      children: [
                        GradientText(
                          "My Projects",
                          colors: const [
                            AppColors.studio,
                            AppColors.paleSlate,
                          ],
                          style: TextStyle(
                            fontSize: size.width * 0.030,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.05,
                            left: 150,
                            right: 150,
                          ),
                          child: Text(
                            'Est duis commodo culpa anim aliquip proident exercitation irure laborum nisi fugiat sunt magna cillum.Officia et sunt ullamco excepteur sint adipisicing labore aute eu sit.Proident ut in officia nisi do Lorem cupidatat eu consectetur enim.',
                            style: TextStyle(
                              fontSize: size.width * 0.012,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: Wrap(
                            spacing: 40.0,
                            runSpacing: 50.0,
                            children: [
                              BusinessCard(
                                logo: "mening_oilam_logo.png",
                                title: "Mening Oilam",
                                description:
                                    "Nulla magna labore dolore labore nisi pariatur velit occaecat est exercitation elit labore duis.Cillum minim consectetur sit qui dolore minim fugiat pariatur aliquip incididunt commodo est occaecat dolor.",
                                onPressed: () {},
                              ),
                              BusinessCard(
                                logo: "muslimUz_logo.png",
                                title: "Muslim uz",
                                description:
                                    "Nulla magna labore dolore labore nisi pariatur velit occaecat est exercitation elit labore duis.Cillum minim consectetur sit qui dolore minim fugiat pariatur aliquip incididunt commodo est occaecat dolor.",
                                onPressed: () {},
                              ),
                              BusinessCard(
                                logo: "chat_logo.png",
                                title: "Chat app",
                                description:
                                    "Nulla magna labore dolore labore nisi pariatur velit occaecat est exercitation elit labore duis.Cillum minim consectetur sit qui dolore minim fugiat pariatur aliquip incididunt commodo est occaecat dolor.",
                                onPressed: () {},
                              ),
                              BusinessCard(
                                logo: "quiz_logo.png",
                                title: "Quiz app",
                                description:
                                    "Nulla magna labore dolore labore nisi pariatur velit occaecat est exercitation elit labore duis.Cillum minim consectetur sit qui dolore minim fugiat pariatur aliquip incididunt commodo est occaecat dolor.",
                                onPressed: () async {
                                  var urllaunchable = await canLaunchUrl(
                                    Uri.https("github.com",
                                        "/SaidazimovToxir/quiz-app"),
                                  );
                                  if (urllaunchable) {
                                    await launchUrl(
                                      Uri.https("github.com",
                                          "/SaidazimovToxir/quiz-app"),
                                    );
                                  }
                                },
                              ),
                              BusinessCard(
                                logo: "quranBot_logo.png",
                                title: "Quran bot",
                                description:
                                    "Nulla magna labore dolore labore nisi pariatur velit occaecat est exercitation elit labore duis.Cillum minim consectetur sit qui dolore minim fugiat pariatur aliquip incididunt commodo est occaecat dolor.",
                                onPressed: () async {
                                  var urllaunchable = await canLaunchUrl(
                                    Uri.https("t.me", "/QuranUzb_bot"),
                                  );
                                  if (urllaunchable) {  
                                    await launchUrl(
                                      Uri.https("t.me", "/QuranUzb_bot"),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.ebony,
                    padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                    child: Column(
                      children: [
                        GradientText(
                          "My Quality Services",
                          colors: const [
                            AppColors.studio,
                            AppColors.paleSlate,
                          ],
                          style: TextStyle(
                            fontSize: size.width * 0.030,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'We put your ideas and thus your wishes in the form of a unique web project that inspires you and you customers.',
                          style: TextStyle(
                            fontSize: size.width * 0.012,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        MyServicesWidget(size: size),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                context.go('/blog');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Blog",
                  style: TextStyle(
                    fontSize: size.width * 0.012,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
