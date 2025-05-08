
// widgets/social_icon.dart - Social media icon
import 'package:flutter/material.dart';
import 'package:webportf/apptheme.dart';


class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIcon({Key? key, required this.icon, required this.url}) : super(key: key);

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: () {
            // Handle tap, e.g., launch URL
          },
          borderRadius: BorderRadius.circular(30),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: _hovering
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              widget.icon,
              color: AppTheme.primaryColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
