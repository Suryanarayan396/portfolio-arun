

// widgets/hero_section.dart - Hero section with profile details and parallax effect
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webportf/model/social_link_data_model.dart';
import 'package:webportf/widgets/social_icon_widget.dart';


class HeroSection extends StatefulWidget {
  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late Animation<double> _entranceAnimation;

  // Animation controllers for bouncy elements
  late AnimationController _bounceController1;
  late AnimationController _bounceController2;
  late AnimationController _bounceController3;
  late AnimationController _abstractController; // Controller for design abstract 2
  late AnimationController _abstractLeftController; // Controller for design abstract (center-left)

  // Bounce animations
  late Animation<double> _bounceAnimation1;
  late Animation<double> _bounceAnimation2;
  late Animation<double> _bounceAnimation3;
  late Animation<double> _abstractAnimation; // Animation for design abstract 2
  late Animation<double> _abstractLeftAnimation; // Animation for design abstract (center-left)

  // Position animations
  late Animation<Offset> _positionAnimation1;
  late Animation<Offset> _positionAnimation2;
  late Animation<Offset> _positionAnimation3;
  late Animation<Offset> _abstractPositionAnimation; // Position animation for design abstract 2
  late Animation<Offset> _abstractLeftPositionAnimation; // Position animation for design abstract (center-left)

  final List<SocialLink> socialLinks = [
    SocialLink(icon: FontAwesomeIcons.github, url: 'https://github.com/ARUNAK97'),
    SocialLink(icon: FontAwesomeIcons.linkedin, url: 'http://www.linkedin.com/in/arun-kumar-p-k-8b91a52aa'),
    SocialLink(icon: FontAwesomeIcons.behance, url: 'https://www.behance.net/akpk97'),
    SocialLink(icon: FontAwesomeIcons.dribbble, url: 'https://dribbble.com/Arunkumarakpk'),
    SocialLink(icon: FontAwesomeIcons.pinterest, url: 'https://pin.it/4xDppYex1'),
  ];

  @override
  void initState() {
    super.initState();

    // Initialize entrance animation
    _entranceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _entranceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeInOut,
    ));

    // Initialize bounce animations with different durations for variety
    _bounceController1 = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _bounceController2 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _bounceController3 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _abstractController = AnimationController(
      duration: const Duration(milliseconds: 4000), // Slower, more elegant movement
      vsync: this,
    );
    _abstractLeftController = AnimationController(
      duration: const Duration(milliseconds: 3500), // Slightly different timing for variety
      vsync: this,
    );

    // Create bouncy animations
    _bounceAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController1,
      curve: Curves.elasticInOut,
    ));

    _bounceAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController2,
      curve: Curves.bounceInOut,
    ));

    _bounceAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController3,
      curve: Curves.elasticOut,
    ));

    _abstractAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _abstractController,
      curve: Curves.easeInOutSine, // Smooth, flowing animation
    ));

    _abstractLeftAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _abstractLeftController,
      curve: Curves.easeInOutCubic, // Slightly different curve for variety
    ));

    // Create floating position animations
    _positionAnimation1 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -20),
    ).animate(CurvedAnimation(
      parent: _bounceController1,
      curve: Curves.easeInOut,
    ));

    _positionAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -15),
    ).animate(CurvedAnimation(
      parent: _bounceController2,
      curve: Curves.easeInOut,
    ));

    _positionAnimation3 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -25),
    ).animate(CurvedAnimation(
      parent: _bounceController3,
      curve: Curves.easeInOut,
    ));

    _abstractPositionAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -30), // Larger movement for more dramatic effect
    ).animate(CurvedAnimation(
      parent: _abstractController,
      curve: Curves.easeInOutSine,
    ));

    _abstractLeftPositionAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -25), // Slightly different movement pattern
    ).animate(CurvedAnimation(
      parent: _abstractLeftController,
      curve: Curves.easeInOutCubic,
    ));

    // Start animations with delays
    _entranceController.forward();

    Future.delayed(const Duration(milliseconds: 500), () {
      _bounceController1.repeat(reverse: true);
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      _bounceController2.repeat(reverse: true);
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      _bounceController3.repeat(reverse: true);
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      _abstractController.repeat(reverse: true);
    });

    Future.delayed(const Duration(milliseconds: 1800), () {
      _abstractLeftController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _bounceController1.dispose();
    _bounceController2.dispose();
    _bounceController3.dispose();
    _abstractController.dispose();
    _abstractLeftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return AnimatedBuilder(
      animation: _entranceAnimation,
      builder: (context, child) {
        return Container(
          height: isMobile ? 500 : isTablet ? 600 : 1000,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Purple gradient background container (base layer)
              Container(
                height: isMobile ? 500 : isTablet ? 600 : 1000,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF8B5CF6), // Light purple
                      Color(0xFF7C3AED), // Medium purple
                      Color(0xFF6D28D9), // Deep purple
                      Color(0xFF5B21B6), // Darker purple
                    ],
                    stops: [0.0, 0.3, 0.7, 1.0],
                  ),
                ),
              ),

              Positioned(
  top: isMobile ? 250 : isTablet ? 200 : 480,
  left: 0,
  right: 0,
  child: Center(
    child: Opacity(
      opacity: 0.7, // Adjust opacity to make it subtle
      child: Image.asset(
        'assets/images/bg word.png', // Replace with your actual PNG file path
        width: isMobile ? 400 : isTablet ? 500 : 1400,
        fit: BoxFit.contain,
      ),
    ),
  ),
),

              // Photo website image as overlay (positioned on top, fully visible)
              Positioned(
                top: 0,
                left: 0,
                right: 0, // Removed mobile constraint to show full image
                bottom: 0,
                child: Image.asset(
                  'assets/images/photo website.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),


              // Animated bouncy PNG elements - Now visible on all devices
              // Frame 57 - Top left floating element
              Positioned(
                top: isMobile ? 100 : isTablet ? 60 : 40,
                left: isMobile ? 10 : isTablet ? 40 : 20,
                child: AnimatedBuilder(
                  animation: _bounceController1,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _positionAnimation1.value,
                      child: Transform.rotate(
                        angle: _bounceAnimation1.value * 0.1,
                        child: Transform.scale(
                          scale: 0.8 + (_bounceAnimation1.value * 0.2),
                          child: Opacity(
                            opacity: (0.7 + (_bounceAnimation1.value * 0.3)).clamp(0.0, 1.0),
                            child: Image.asset(
                              'assets/png/Frame 57.png',
                              width: isMobile ? 80 : isTablet ? 140 : 180,
                              height: isMobile ? 80 : isTablet ? 140 : 180,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Frame 68 - Top right floating element
              Positioned(
                top: isMobile ? 120 : isTablet ? 100 : 80,
                right: isMobile ? 50 : isTablet ? 60 : 40,
                child: AnimatedBuilder(
                  animation: _bounceController2,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _positionAnimation2.value,
                      child: Transform.rotate(
                        angle: -_bounceAnimation2.value * 0.15,
                        child: Transform.scale(
                          scale: 0.9 + (_bounceAnimation2.value * 0.1),
                          child: Opacity(
                            opacity: (0.6 + (_bounceAnimation2.value * 0.4)).clamp(0.0, 1.0),
                            child: Image.asset(
                              'assets/png/Frame 68.png',
                              width: isMobile ? 70 : isTablet ? 130 : 170,
                              height: isMobile ? 70 : isTablet ? 130 : 170,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Frame 69 - Bottom left floating element
              Positioned(
                bottom: isMobile ? 200 : isTablet ? 80 : 120,
                right: isMobile ? 20 : isTablet ? 80 : 60,
                child: AnimatedBuilder(
                  animation: _bounceController3,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _positionAnimation3.value,
                      child: Transform.rotate(
                        angle: _bounceAnimation3.value * 0.12,
                        child: Transform.scale(
                          scale: 0.7 + (_bounceAnimation3.value * 0.3),
                          child: Opacity(
                            opacity: (0.5 + (_bounceAnimation3.value * 0.5)).clamp(0.0, 1.0),
                            child: Image.asset(
                              'assets/png/Frame 69.png',
                              width: isMobile ? 90 : isTablet ? 150 : 200,
                              height: isMobile ? 90 : isTablet ? 150 : 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Design Abstract 2 - Center right floating element
              Positioned(
                bottom: isMobile ? 120 : isTablet ? 200 : 60  ,
                left: isMobile ? 10 : isTablet ? 30 : 50,
                child: AnimatedBuilder(
                  animation: _abstractController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _abstractPositionAnimation.value,
                      child: Transform.rotate(
                        angle: _abstractAnimation.value * 0.08, // Gentle rotation
                        child: Transform.scale(
                          scale: 0.8 + (_abstractAnimation.value * 0.2),
                          child: Opacity(
                            opacity: (0.6 + (_abstractAnimation.value * 0.4)).clamp(0.0, 1.0),
                            child: Image.asset(
                              'assets/png/design abstract 2.png',
                              width: isMobile ? 50 : isTablet ? 160 : 220,
                              height: isMobile ? 50 : isTablet ? 160 : 220,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Design Abstract - Center left floating element
              Positioned(
                top: isMobile ? 180 : isTablet ? 220 : 350,
                left: isMobile ? 60 : isTablet ? 30 : 320,
                child: AnimatedBuilder(
                  animation: _abstractLeftController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _abstractLeftPositionAnimation.value,
                      child: Transform.rotate(
                        angle: -_abstractLeftAnimation.value * 0.06, // Opposite rotation for variety
                        child: Transform.scale(
                          scale: 0.85 + (_abstractLeftAnimation.value * 0.15),
                          child: Opacity(
                            opacity: (0.65 + (_abstractLeftAnimation.value * 0.35)).clamp(0.0, 1.0),
                            child: Image.asset(
                              'assets/png/design abstract 2.png',
                              width: isMobile ? 50 : isTablet ? 150 : 200,
                              height: isMobile ? 50 : isTablet ? 150 : 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Content with entrance animation
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       // Add some top spacing

                      // Animated title
                      Transform.translate(
                        offset: Offset(0, 50 * (1 - _entranceAnimation.value)),
                        child: Opacity(
                          opacity: _entranceAnimation.value,
                          child: Text(
                            'Hi I\'M Arun Kumar PK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withValues(alpha: 0.8),
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      SizedBox(height: 20), // Reduced spacing

                      // Animated subtitle
                      Transform.translate(
                        offset: Offset(0, 30 * (1 - _entranceAnimation.value)),
                        child: Opacity(
                          opacity: _entranceAnimation.value * 0.9,
                          child: Text(
                            'Product Designer & Software Tester',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isMobile ? 14 : 16, // Reduced subtitle size
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),

              // Social icons positioned horizontally at bottom right corner
             // Replace the existing Positioned widget for social icons with this:
Positioned(
  bottom: 40,
  right: isMobile || isTablet ? 60 : 70, // Only set right for desktop
  left: isMobile || isTablet ? 60 : null, // Stretch to full width for mobile/tablet
  child: Transform.translate(
    offset: Offset(20 * (1 - _entranceAnimation.value), 0),
    child: Opacity(
      opacity: _entranceAnimation.value,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Center( // Add Center widget here to center the Row
          child: Row(
            mainAxisSize: MainAxisSize.min, // Important for centering
            children: socialLinks.map((link) {
              return AnimatedBuilder(
                animation: _entranceAnimation,
                builder: (context, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 5 : 6),
                    child: Transform.scale(
                      scale: 0.5 + (0.5 * _entranceAnimation.value),
                      child: Opacity(
                        opacity: _entranceAnimation.value,
                        child: SocialIcon(
                          icon: link.icon,
                          url: link.url,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    ),
  ),
),
            ],
          ),
        );
      },
    );
  }
}
