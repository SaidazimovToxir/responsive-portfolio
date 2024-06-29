import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/styles.dart';
import 'package:portfolio/screens/tablet/tablet_layout_page.dart';
import 'package:portfolio/screens/widgets/carusel_slider.dart';
import 'package:portfolio/screens/widgets/count_container_widget.dart';
import 'package:portfolio/screens/widgets/header_text_widget.dart';
import 'package:portfolio/screens/widgets/myservice_widgets.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
            child: Column(
              children: [
                Container(
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatingImageContainer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            HeaderTextWidget(
                              size: size,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Social_Tab(size: size)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountWidget(
                        size: size,
                        text1: "14",
                        text2: "Years of",
                        text3: "Experience",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CountWidget(
                        size: size,
                        text1: "50+",
                        text2: "Projects",
                        text3: "Completed",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CountWidget(
                        size: size,
                        text1: "1.5K",
                        text2: "Happy",
                        text3: "Customers",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
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
                  height: size.width * 0.13,
                ),
                GradientText(
                  "My Projects",
                  style: const TextStyle(fontSize: 40),
                  colors: const [
                    AppColors.studio,
                    AppColors.paleSlate,
                  ],
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                const CaruselSlider(),
                SizedBox(
                  height: size.width * 0.09,
                ),
                MyServicesWidget(size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
