
// widgets/footer_widget.dart - Footer with links
import 'package:flutter/material.dart';
import 'package:webportf/apptheme.dart';
import 'package:webportf/model/footersection_datamodel.dart';
import 'package:webportf/widgets/footercolumn_widget.dart';


class FooterWidget extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: AppTheme.secondaryColor,
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Text('Logo',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          isMobile
              ? Column(
                  children: footerSections.map((section) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: FooterColumn(
                        title: section.title,
                        items: section.items,
                      ),
                    );
                  }).toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: footerSections.asMap().entries.map((entry) {
                    int idx = entry.key;
                    FooterSection section = entry.value;
                    return Row(
                      children: [
                        FooterColumn(
                          title: section.title,
                          items: section.items,
                        ),
                        if (idx < footerSections.length - 1) SizedBox(width: 32),
                      ],
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
