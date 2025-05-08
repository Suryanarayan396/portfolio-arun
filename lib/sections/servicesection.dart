
// widgets/services_section.dart - Services offered section
import 'package:flutter/material.dart';
import 'package:webportf/model/service_model.dart';
import 'package:webportf/widgets/service_card_widget.dart';


class ServicesSection extends StatelessWidget {
  final List<Service> services = [
    Service(icon: Icons.brush, title: 'Landing Page Design',
           description: 'Custom landing page designs to convert visitors into customers.'),
    Service(icon: Icons.phone_android, title: 'Mobile App Design',
           description: 'Intuitive and engaging mobile app interfaces for iOS and Android.'),
    Service(icon: Icons.web, title: 'Website Design',
           description: 'Responsive website designs that look great on all devices.'),
    Service(icon: Icons.design_services, title: 'Logo Creation',
           description: 'Professional logo design to establish your brand identity.'),
    Service(icon: Icons.trending_up, title: 'SEO Marketing',
           description: 'Boost your online visibility and drive organic traffic to your website.'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Text('Services',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Professional design and digital marketing services to help your business grow.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          if (isMobile)
            Column(
              children: services.map((service) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ServiceCard(
                    icon: service.icon,
                    title: service.title,
                    description: service.description,
                  ),
                );
              }).toList(),
            )
          else if (isTablet)
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: services.map((service) => ServiceCard(
                icon: service.icon,
                title: service.title,
                description: service.description,
              )).toList(),
            )
          else
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: services.map((service) => ServiceCard(
                icon: service.icon,
                title: service.title,
                description: service.description,
              )).toList(),
            ),
        ],
      ),
    );
  }
}
