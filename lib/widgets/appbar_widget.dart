import 'package:flutter/material.dart';
import 'package:webportf/AppRoutes.dart';
import 'package:webportf/apptheme.dart';
import 'package:webportf/constants/app_color_constants.dart';

import 'package:webportf/widgets/HireMeBottomSheet.dart';

class AppBarWidget extends StatelessWidget {
  // Your email address where you want to receive the interview requests
  final String recipientEmail = "your.email@example.com"; // Replace with your email

  const AppBarWidget({Key? key}) : super(key: key);

  void _openSidebarMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFAFBFC), // Very light blue-gray
                      Color(0xFFF8FAFC), // Light blue-gray
                      Colors.white,
                    ],
                    stops: [0.0, 0.3, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 30,
                      offset: const Offset(8, 0),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(4, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: _buildSidebarContent(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return Column(
      children: [
        // Elegant Sidebar Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8B5CF6),
                Color(0xFF7C3AED),
                Color(0xFF6D28D9),
              ],
              stops: [0.0, 0.5, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF8B5CF6).withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Elegant logo container
                SizedBox(
                  height: 40,
                  child: Image.asset(
                    'assets/png/logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        'AK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Professional name styling
                Text(
                  'ARUN KUMAR P K',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Elegant subtitle with accent line
                Column(
                  children: [
                    Container(
                      width: 40,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(0.5),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Designer & Developer',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Elegant Menu Items
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                // Navigation section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Navigation label
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 16),
                        child: Text(
                          'NAVIGATION',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF64748B),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),

                      // Menu items with elegant spacing
                      _buildSidebarMenuItem(
                        context,
                        Icons.home_rounded,
                        'Home',
                        () => Navigator.pushNamed(context, AppRoutes.home),
                      ),
                      const SizedBox(height: 8),
                      _buildSidebarMenuItem(
                        context,
                        Icons.design_services_rounded,
                        'Services',
                        () => Navigator.pushNamed(context, AppRoutes.services),
                      ),
                      const SizedBox(height: 8),
                      _buildSidebarMenuItem(
                        context,
                        Icons.work_outline_rounded,
                        'Portfolio',
                        () => Navigator.pushNamed(context, AppRoutes.portfolio),
                      ),
                      const SizedBox(height: 8),
                      _buildSidebarMenuItem(
                        context,
                        Icons.person_outline_rounded,
                        'About',
                        () => Navigator.pushNamed(context, AppRoutes.about),
                      ),
                      const SizedBox(height: 8),
                      _buildSidebarMenuItem(
                        context,
                        Icons.contact_mail_rounded,
                        'Contact',
                        () => Navigator.pushNamed(context, AppRoutes.contact),
                      ),
                    ],
                  ),
                ),

                // Elegant call-to-action button
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF8B5CF6),
                        Color(0xFF7C3AED),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8B5CF6).withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _showHireMeBottomSheet(context);
                    },
                    icon: Icon(Icons.work_outline_rounded, color: Colors.white, size: 18),
                    label: Text(
                      'Hire Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSidebarMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            onTap();
          },
          borderRadius: BorderRadius.circular(12),
          splashColor: Color(0xFF8B5CF6).withValues(alpha: 0.1),
          highlightColor: Color(0xFF8B5CF6).withValues(alpha: 0.05),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Elegant icon container
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5CF6).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Color(0xFF8B5CF6),
                    size: 18,
                  ),
                ),
                const SizedBox(width: 16),

                // Professional text styling
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1E293B),
                      letterSpacing: 0.2,
                    ),
                  ),
                ),

                // Subtle arrow indicator
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF64748B),
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.home),
            child: SizedBox(
              height: 40,
              child: Image.asset(
                'assets/png/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback to text if image fails to load
                  return Text(
                    'Logo',
                    style: TextStyle(color: AppColorConstants.white, fontSize: 20)
                  );
                },
              ),
            ),
          ),
          Row(
            children: isMobile
                ? [
                    IconButton(
                      icon: Icon(Icons.menu, color: AppColorConstants.white),
                      onPressed: () => _openSidebarMenu(context),
                    )
                  ]
                : [
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.home),
                        child: Text('Home', style: TextStyle(color: AppColorConstants.white))),
                    SizedBox(width: 16),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.services),
                        child: Text('Services', style: TextStyle(color: AppColorConstants.white))),
                    SizedBox(width: 16),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.portfolio),
                        child: Text('Portfolio', style: TextStyle(color: AppColorConstants.white))),
                    SizedBox(width: 16),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.contact),
                        child: Text('Contact', style: TextStyle(color: AppColorConstants.white))),
                    SizedBox(width: 16),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorConstants.white,
                          foregroundColor: AppTheme.primaryColor,
                        ),
                        onPressed: () => _showHireMeBottomSheet(context),
                        child: Text('Hire Me')),
                  ],
          ),
        ],
      ),
    );
  }


void _showHireMeBottomSheet(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 600;

  if (isMobile) {
    // Mobile: Elegant Bottom Sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xFFFAFBFC),
            ],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 30,
              offset: Offset(0, -10),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Elegant handle bar
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

            // Content with elegant padding
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: HireMeBottomSheet(recipientEmail: recipientEmail),
            ),

            // Elegant close button
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFE2E8F0),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.close_rounded, color: Color(0xFF64748B), size: 20),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(minWidth: 40, minHeight: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    // Desktop/Tablet: Elegant Dialog Box
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.8,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
          child: FadeTransition(
            opacity: animation,
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                margin: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Color(0xFFFAFBFC),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 40,
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                    ),
                  ],
                  border: Border.all(
                    color: Color(0xFFE2E8F0),
                    width: 1,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      // Elegant header with gradient accent
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF8B5CF6),
                                Color(0xFF7C3AED),
                              ],
                            ),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                        ),
                      ),

                      // Content with elegant padding
                      Padding(
                        padding: EdgeInsets.all(32),
                        child: HireMeBottomSheet(recipientEmail: recipientEmail),
                      ),

                      // Elegant close button
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xFFE2E8F0),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.close_rounded, color: Color(0xFF64748B), size: 20),
                            onPressed: () => Navigator.pop(context),
                            padding: EdgeInsets.all(8),
                            constraints: BoxConstraints(minWidth: 40, minHeight: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
}