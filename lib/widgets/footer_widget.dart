
// widgets/footer_widget.dart - Footer with links
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webportf/apptheme.dart';
import 'package:webportf/model/footersection_datamodel.dart';
import 'package:webportf/model/social_link_data_model.dart';
import 'package:webportf/widgets/footercolumn_widget.dart';
import 'package:webportf/widgets/social_icon_widget.dart';


class FooterWidget extends StatelessWidget {
  FooterWidget({super.key});

  final List<FooterSection> footerSections = [
    FooterSection(
      title: 'Home',
      items: ['Home', 'Services', 'Portfolio', 'Contact']
    ),
    FooterSection(
      title: 'Services',
      items: ['Landing Page Design', 'Mobile App Design', 'Website Design']
    ),
    FooterSection(
      title: 'Contact',
      items: ['Email', 'Phone', 'Address']
    ),
  ];

  final List<SocialLink> socialLinks = [
    SocialLink(icon: FontAwesomeIcons.github, url: 'https://github.com/ARUNAK97'),
    SocialLink(icon: FontAwesomeIcons.linkedin, url: 'http://www.linkedin.com/in/arun-kumar-p-k-8b91a52aa'),
    SocialLink(icon: FontAwesomeIcons.behance, url: 'https://www.behance.net/akpk97'),
    SocialLink(icon: FontAwesomeIcons.dribbble, url: 'https://dribbble.com/Arunkumarakpk'),
    SocialLink(icon: FontAwesomeIcons.pinterest, url: 'https://pin.it/4xDppYex1'),
  ];

  void _scrollToTop(BuildContext context) {
    // Simple and reliable scroll to top
    try {
      // Find the nearest Scrollable widget
      final scrollableState = Scrollable.maybeOf(context);
      if (scrollableState != null) {
        scrollableState.position.animateTo(
          0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        return;
      }

      // Fallback: Try PrimaryScrollController
      final primaryController = PrimaryScrollController.maybeOf(context);
      if (primaryController != null && primaryController.hasClients) {
        primaryController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        return;
      }

      // If all else fails, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Scroll to top not available'),
          duration: Duration(seconds: 1),
        ),
      );
    } catch (e) {
      // Silent fail - don't show error to user
      debugPrint('Scroll to top failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              // Logo
              SizedBox(
                height: 60,
                child: Image.asset(
                  'assets/png/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to text if image fails to load
                    return Text(
                      'Logo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),

              // Social Icons Row
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: socialLinks.map((link) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: SocialIcon(
                        icon: link.icon,
                        url: link.url,
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 16),
              Text(
                'Creative Designer & Developer passionate about creating beautiful digital experiences.',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

            
                
            ],
          ),
        ),

        // Back to Top Button
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _scrollToTop(context),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Back to Top',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
