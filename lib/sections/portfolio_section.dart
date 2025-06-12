
// widgets/portfolio_section.dart - Portfolio showcase
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:webportf/AppRoutes.dart';
import 'package:webportf/model/portfolio_item_model.dart';
import 'package:webportf/widgets/portfoliocard_widget.dart';

class PortfolioSection extends StatefulWidget {
  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _staggeredController;
  late List<Animation<double>> _staggeredAnimations;
  late AnimationController _mobileGridController;
  late Animation<double> _mobileGridAnimation;
  
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

  final List<String> toolImages = [
    'assets/png/Adobe illustartor logo.png',
    'assets/png/Adobe XD logo.png',
    'assets/png/Appium logo.png',
    'assets/png/Canva logo.png',
    'assets/png/CorelDraw logo.png',
    'assets/png/Creatie AI Logo.png',
    'assets/png/Figma logo.png',
    'assets/png/Photoshop Logo.png',
    'assets/png/Postman Logo.png',
    'assets/png/Selenium logo.png',
    'assets/png/Sketch app logo.png',
    'assets/png/Webflow logo.png',
  ];

  @override
  void initState() {
    super.initState();
    
    // Initialize staggered animation controller for desktop tools
    _staggeredController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    );
    
    // Create individual animations for each tool with staggered delays
    _staggeredAnimations = List.generate(
      toolImages.length,
      (index) => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _staggeredController,
          curve: Interval(
            index * 0.05, // Staggered start times
            0.3 + index * 0.05, // Longer animation duration
            curve: Curves.easeInOutSine,
          ),
        ),
      ),
    );
    
    // Initialize mobile grid animation
    _mobileGridController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    
    _mobileGridAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _mobileGridController,
        curve: Curves.easeInOutSine,
      ),
    );
    
    // Start animations with a slight delay
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        _staggeredController.repeat(reverse: true);
        _mobileGridController.repeat(reverse: true);
      }
    });
  }
  
  @override
  void dispose() {
    _staggeredController.dispose();
    _mobileGridController.dispose();
    super.dispose();
  }

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
             SizedBox(height: 24),
 
             
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Tools & Platforms',
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
                SizedBox(height: 32),

                
                isMobile 
                  ? AnimatedBuilder(
                      animation: _mobileGridAnimation,
                      builder: (context, child) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: toolImages.length,
                          itemBuilder: (context, index) {
                            // Create interchanging effect by rotating and scaling based on animation value
                            final angle = math.sin((_mobileGridAnimation.value * math.pi * 2) + (index * 0.5)) * 0.1;
                            final scale = 0.9 + math.sin((_mobileGridAnimation.value * math.pi * 2) + (index * 0.7)) * 0.1;
                            
                            return Transform.rotate(
                              angle: angle,
                              child: Transform.scale(
                                scale: scale,
                                child: _buildToolItem(toolImages[index], true),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : SizedBox(
                      height: 50, // Fixed height for the row
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _staggeredController,
                          builder: (context, child) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: toolImages.length,
                              itemBuilder: (context, index) {
                                // Create wavy effect with sine waves
                                final verticalOffset = math.sin(
                                  (_staggeredAnimations[index].value * math.pi * 2) + (index * 0.5)
                                ) * 10.0; // Vertical wave amplitude
                                
                                final scale = 0.9 + math.sin(
                                  (_staggeredAnimations[index].value * math.pi * 2) + (index * 0.7)
                                ) * 0.1; // Subtle scale wave
                                
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Transform.translate(
                                    offset: Offset(0, verticalOffset),
                                    child: Transform.scale(
                                      scale: scale,
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.08),
                                              blurRadius: 10,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          border: Border.all(
                                            color: Color(0xFFE2E8F0),
                                            width: 1,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Image.asset(
                                          toolImages[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                SizedBox(height: 40),

        ],
      ),
    );
  }

  Widget _buildToolItem(String imagePath, [bool isMobile = false]) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: isMobile ? 6 : 10,
            offset: Offset(0, isMobile ? 2 : 3),
          ),
        ],
        border: Border.all(
          color: Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(isMobile ? 6 : 10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
