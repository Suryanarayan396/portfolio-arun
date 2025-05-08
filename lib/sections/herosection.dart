

// widgets/hero_section.dart - Hero section with profile details
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webportf/model/social_link_data_model.dart';
import 'package:webportf/widgets/social_icon_widget.dart';


class HeroSection extends StatelessWidget {
  final List<SocialLink> socialLinks = [
    // SocialLink(icon: FontAwesomeIcons.instagram, url: 'https://instagram.com'),
    SocialLink(icon: FontAwesomeIcons.linkedin, url: 'https://linkedin.com'),
    SocialLink(icon: FontAwesomeIcons.behance, url: 'https://www.behance.net/akpk97'),
    SocialLink(icon: FontAwesomeIcons.dribbble, url: 'https://dribbble.com/Arunkumarakpk'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      height: isMobile ? 400 : isTablet ? 500 : 1200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/arun poster.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(
            'HI I\'M Jenny Wilson',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: socialLinks.map((link) => SocialIcon(
              icon: link.icon,
              url: link.url,
            )).toList(),
          ),
        ],
      ),
    );
  }
}
