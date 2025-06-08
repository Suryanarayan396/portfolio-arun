
// widgets/service_card.dart - Modern minimalistic service card
import 'package:flutter/material.dart';
import 'package:webportf/constants/app_color_constants.dart';


class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> with TickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 240, // Reduced width for minimalistic design
              height: 180, // Increased height to fix overflow
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColorConstants.white,
                borderRadius: BorderRadius.circular(16), // More rounded for modern look
                border: Border.all(
                  color: _isHovered
                      ? AppColorConstants.primaryPurple.withValues(alpha: 0.3)
                      : Colors.grey.withValues(alpha: 0.1),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? AppColorConstants.primaryPurple.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.05),
                    blurRadius: _isHovered ? 20 : 8,
                    offset: const Offset(0, 4),
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16), // Optimized padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Minimize column size
                  children: [
                    // Minimalistic icon with subtle background
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColorConstants.primaryPurple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.icon,
                        size: 22, // Slightly smaller icon
                        color: AppColorConstants.primaryPurple,
                      ),
                    ),

                    const SizedBox(height: 12), // Reduced spacing

                    // Clean title typography
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15, // Slightly smaller font
                        fontWeight: FontWeight.w600,
                        color: AppColorConstants.black,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 6), // Reduced spacing

                    // Subtle description with opacity animation
                    Flexible( // Use Flexible to prevent overflow
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 11, // Smaller description text
                            color: AppColorConstants.gray600,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3, // Allow more lines for better text distribution
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
