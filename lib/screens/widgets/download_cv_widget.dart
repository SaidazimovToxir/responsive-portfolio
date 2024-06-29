import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCVButton extends StatefulWidget {
  const DownloadCVButton({super.key});

  @override
  State<DownloadCVButton> createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<DownloadCVButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: GestureDetector(
        onTap: () async {
          var urllaunchable = await canLaunchUrl(
            Uri.https("drive.google.com", "/file/d//view"),
          );
          if (urllaunchable) {
            await launchUrl(
              Uri.https("drive.google.com", "/file/d//view"),
            );
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [
                      AppColors.studio,
                      AppColors.ebony,
                    ],
                  )
                : const LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
            // color: _isHovered ?  : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.paleSlate),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Download CV",
                style: TextStyle(
                  color:
                      _isHovered ? AppColors.hippieBlue : AppColors.paleSlate,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox.square(dimension: 12),
              FaIcon(
                FontAwesomeIcons.download,
                color: _isHovered ? AppColors.hippieBlue : AppColors.paleSlate,
                size: 18,
              ),
            ],
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
