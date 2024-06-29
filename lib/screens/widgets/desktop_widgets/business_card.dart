import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/colors.dart';

class BusinessCard extends StatefulWidget {
  final String logo;
  final String title;
  final String description;
  final Function() onPressed;
  const BusinessCard({
    super.key,
    required this.logo,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -10, 0))
            : Matrix4.identity(),
        child: Container(
          width: 315,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.studio.withOpacity(0.8),
                AppColors.studio.withOpacity(0.3),
                AppColors.studio.withOpacity(0.0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/projects/${widget.logo}",
                      width: size.width * 0.050,
                    ),
                    const Gap(10.0),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.010,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    widget.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.paleSlate,
                      fontSize: size.width * 0.009,
                      fontFamily: 'Poppins',
                      height: 1.8,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: widget.onPressed,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff858ced).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0xff858ced),
                            width: 0.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.015,
                            vertical: size.width * 0.005,
                          ),
                          child: Text(
                            "VIEW MORE",
                            style: TextStyle(
                              color: Color(0xff858ced),
                              fontSize: size.width * 0.010,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
