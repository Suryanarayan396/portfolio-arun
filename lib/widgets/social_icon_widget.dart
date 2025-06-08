
// widgets/social_icon.dart - Social media icon
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webportf/apptheme.dart';


class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIcon({super.key, required this.icon, required this.url});

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _hovering = false;

  // Method to launch URL
  Future<void> _launchUrl() async {
    if (widget.url.isNotEmpty) {
      final Uri uri = Uri.parse(widget.url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        // Handle error - could show a snackbar or dialog
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not launch ${widget.url}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: _launchUrl,
          borderRadius: BorderRadius.circular(30),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8), // Reduced padding
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: _hovering
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              widget.icon,
              color: AppTheme.primaryColor,
              size: 16, // Reduced icon size
            ),
          ),
        ),
      ),
    );
  }
}
