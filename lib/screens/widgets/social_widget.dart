import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SocialIconButton(
          icon: FontAwesomeIcons.linkedinIn,
          onPressed: () async {
            var urllaunchable = await canLaunchUrl(
                Uri.https("linkedin.com", "/in/toxir-saidazimov"));
            if (urllaunchable) {
              await launchUrl(
                  Uri.https("linkedin.com", "/in/toxir-saidazimov"));
            }
          },
        ),
        const SizedBox(width: 10),
        SocialIconButton(
          icon: FontAwesomeIcons.github,
          onPressed: () async {
            var urllaunchable =
                await canLaunchUrl(Uri.https("github.com", "/SaidazimovToxir"));
            if (urllaunchable) {
              await launchUrl(Uri.https("github.com", "/SaidazimovToxir"));
            }
          },
        ),
        const SizedBox(width: 10),
        SocialIconButton(
          icon: FontAwesomeIcons.telegram,
          onPressed: () async {
            var urllaunchable =
                await canLaunchUrl(Uri.https("t.me", "/citytech_uz"));
            if (urllaunchable) {
              await launchUrl(Uri.https("t.me", "/citytech_uz"));
            }
          },
        ),
        const SizedBox(width: 10),
        SocialIconButton(
          icon: FontAwesomeIcons.telegram,
          isNoIcon: true,
          onPressed: () async {
            var urllaunchable = await canLaunchUrl(
                Uri.https("leetcode.com", "/u/TohirSaidazimov/"));
            if (urllaunchable) {
              await launchUrl(
                Uri.https("leetcode.com", "/u/TohirSaidazimov/"),
              );
            }
          },
        ),
      ],
    );
  }
}

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool? isNoIcon;

  const SocialIconButton({
    super.key,
    this.isNoIcon,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: isHovered ? 50 : 40,
        width: isHovered ? 50 : 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.studio.withOpacity(0.5)),
        ),
        child: Center(
          child: IconButton(
            hoverColor: Colors.transparent,
            onPressed: widget.onPressed,
            icon: widget.isNoIcon == null
                ? FaIcon(
                    widget.icon,
                    color: isHovered ? AppColors.paleSlate : AppColors.studio,
                    size: isHovered ? 18 : 15,
                  )
                : ImageIcon(
                    const AssetImage("assets/images/LeetCode.png"),
                    color: isHovered ? AppColors.paleSlate : AppColors.studio,
                    size: isHovered ? 20 : 15,
                  ),
          ),
        ),
      ),
    );
  }
}
