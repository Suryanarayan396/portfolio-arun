
// widgets/services_section.dart - Modern minimalistic services section
import 'package:flutter/material.dart';
import 'package:webportf/model/service_model.dart';
import 'package:webportf/widgets/service_card_widget.dart';
import 'package:webportf/constants/app_color_constants.dart';


class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final List<Service> services = [
    Service(icon: Icons.brush_outlined, title: 'Landing Pages',
           description: 'Custom designs that convert visitors into customers'),
    Service(icon: Icons.phone_android_outlined, title: 'Mobile Apps',
           description: 'Intuitive interfaces for iOS and Android platforms'),
    Service(icon: Icons.web_outlined, title: 'Web Design',
           description: 'Responsive designs that work on all devices'),
    Service(icon: Icons.palette_outlined, title: 'Brand Identity',
           description: 'Professional logos and brand design systems'),
    Service(icon: Icons.trending_up_outlined, title: 'SEO & Marketing',
           description: 'Boost visibility and drive organic traffic'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.02), // Very subtle background
      ),
      child: Column(
        children: [
          // Modern section header
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                // Minimalistic title
                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.w300, // Lighter weight for elegance
                    color: AppColorConstants.black,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                // Subtle divider
                Container(
                  width: 60,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColorConstants.primaryPurple.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),

                const SizedBox(height: 20),

                // Clean description
                Text(
                  'Crafting digital experiences that drive results',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    color: AppColorConstants.gray600,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: isMobile ? 40 : 50),

          // Services grid with improved layout
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildServicesGrid(isMobile, isTablet),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesGrid(bool isMobile, bool isTablet) {
    if (isMobile) {
      // Mobile: Single column with reduced spacing
      return Column(
        children: services.map((service) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ServiceCard(
              icon: service.icon,
              title: service.title,
              description: service.description,
            ),
          );
        }).toList(),
      );
    } else {
      // Tablet and Desktop: Clean grid layout
      return Wrap(
        spacing: 20, // Reduced spacing for minimalistic design
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: services.map((service) => ServiceCard(
          icon: service.icon,
          title: service.title,
          description: service.description,
        )).toList(),
      );
    }
  }
}
