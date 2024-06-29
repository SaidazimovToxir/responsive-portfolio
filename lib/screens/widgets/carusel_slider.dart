import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class CaruselSlider extends StatelessWidget {
  const CaruselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.ebony,
                AppColors.studio.withOpacity(0.2),
                AppColors.ebony.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/projects/mening_oilam_logo.png",
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.ebony.withOpacity(0.5),
                                AppColors.studio.withOpacity(0.5),
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            child: Text(
                              "Mening oilam",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Amet offi dsfdgfhjdgrsefasrhdt ahrtjdhdhf hghh fhfggffg hesth sfhfg dheshne rgerg",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff858ced).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xff858ced),
                                  width: 0.5,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0,
                                  vertical: 3,
                                ),
                                child: Text(
                                  "VIEW MORE",
                                  style: TextStyle(
                                    color: Color(0xff858ced),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/projects/mening_oilam1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 0.6,
        aspectRatio: 16 / 9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
    );
  }
}
