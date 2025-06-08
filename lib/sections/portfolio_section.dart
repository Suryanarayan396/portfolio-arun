
// widgets/portfolio_section.dart - Portfolio showcase
import 'package:flutter/material.dart';
import 'package:webportf/AppRoutes.dart';
import 'package:webportf/model/portfolio_item_model.dart';
import 'package:webportf/widgets/portfoliocard_widget.dart';


class PortfolioSection extends StatelessWidget {
  final List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      imageUrl: 'assets/png/Landing page.png',
      title: 'Website Landing Page Design',
      description: 'Modern, responsive landing pages with clean UI/UX design and optimized user experience',
      url: 'https://github.com/ARUNAK97/Landing-Page-Projects.git',
    ),
    PortfolioItem(
      imageUrl: 'assets/png/Mobile APP design.png',
      title: 'Mobile App UI&UX Design',
      description:'I created clean, user-centered interfaces for mobile apps and web platforms in industries such as automotive services, food delivery, and business management. Each project included a complete design process ranging from user research and wireframing to high-fidelity prototyping and responsive design.',
      url: 'https://github.com/ARUNAK97/UI-UX-Designs.git',
    ),
    // PortfolioItem(
    //   imageUrl: 'assets/png/Mobile APP design2.png',
    //   title: 'Mobile App UX Design',
    //   description: 'Comprehensive mobile app design with wireframes, prototypes, and user journey mapping',
    //   url: 'https://github.com/ARUNAK97/UI-UX-Designs.git',
    // ),
    PortfolioItem(
      imageUrl: 'assets/png/Freshday cart automation.png',
      title: 'Software Testing',
      description: 'Automated testing framework for e-commerce cart functionality with comprehensive test coverage',
      url: 'https://github.com/ARUNAK97/Automation_Project.git',
    ),
    PortfolioItem(
      imageUrl: 'assets/png/Graphic design.png',
      title: 'Graphic designing',
      description: 'With this project, I redesigned a variety of popular brand and tech symbols in a unified monochrome gradient style, balancing minimalism with brand recognition.',
      url: 'https://github.com/ARUNAK97/Graphic-designs.git',
    ),
    PortfolioItem(
      imageUrl: 'assets/png/product desiging thumbnail.png',
      title: 'Product Design',
      description: 'With my latest project, I designed packages, advertising, promotions, and outdoor advertisements for a variety of brands, including FMCG and automobile brands.',
      url: 'https://github.com/ARUNAK97/UI-UX-Designs.git',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFAFBFC), // Very light gray-blue
            Color(0xFFF8FAFC), // Light gray-blue
            Colors.white,
          ],
          stops: [0.0, 0.3, 1.0],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: 16
      ),
      child: Column(
        children: [
          // Elegant section header
          Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                // Main title with sophisticated typography
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Featured Work',
                    style: TextStyle(
                      fontSize: isMobile ? 32 : 42,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF1E293B),
                      letterSpacing: 1.5,
                      height: 1.2,
                    ),
                  ),
                ),
                SizedBox(height: 12),

                // Elegant accent line
                Container(
                  width: isMobile ? 80 : 120,
                  height: 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8B5CF6).withValues(alpha: 0.3),
                        Color(0xFF8B5CF6),
                        Color(0xFF7C3AED),
                        Color(0xFF8B5CF6).withValues(alpha: 0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 24),

                // Professional description
                Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Text(
                    'I\'m passionate about designing digital experiences that are not just beautiful, but also intuitive and user-centered. Here’s a selection of projects where I led UI/UX design from ideation to delivery.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      color: Color(0xFF475569),
                      height: 1.7,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile ? 40 : 50),
          // Portfolio grid with enhanced spacing and layout
          Container(
            constraints: BoxConstraints(maxWidth: 1200),
            child: GridView.count(
              crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: isMobile ? 1.0 : 1.1,
              mainAxisSpacing: isMobile ? 24 : 32, // Enhanced spacing
              crossAxisSpacing: isMobile ? 0 : 32, // Enhanced spacing
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 0 : 16,
                vertical: 8,
              ),
              children: portfolioItems.map((item) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: PortfolioCard(
                  imageUrl: item.imageUrl,
                  title: item.title,
                  url: item.url,
                  isAsset: true,
                  projectcontent: item.description ?? 'Project showcase',
                ),
              )).toList(),
            ),
          ),
          SizedBox(height: isMobile ? 32 : 40),

          // Elegant call-to-action button
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8B5CF6),
                  Color(0xFF7C3AED),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF8B5CF6).withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: Offset(0, 6),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.portfolio);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 32 : 40,
                  vertical: isMobile ? 16 : 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View All Projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 16 : 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: isMobile ? 18 : 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
