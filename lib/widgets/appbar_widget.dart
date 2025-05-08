import 'package:flutter/material.dart';
import 'package:webportf/AppRoutes.dart';
import 'package:webportf/apptheme.dart';
import 'package:webportf/constants/app_color_constants.dart';

import 'package:webportf/widgets/HireMeBottomSheet.dart';

class AppBarWidget extends StatelessWidget {
  // Your email address where you want to receive the interview requests
  final String recipientEmail = "your.email@example.com"; // Replace with your email

  const AppBarWidget({Key? key}) : super(key: key);

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
            child: Text('Logo', style: TextStyle(color: AppColorConstants.white, fontSize: 20)),
          ),
          Row(
            children: isMobile
                ? [
                    IconButton(
                      icon: Icon(Icons.menu, color: AppColorConstants.white),
                      onPressed: () {
                        // Show modal bottom sheet with menu options
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Wrap(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.home),
                                  title: Text('Home'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, AppRoutes.home);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.design_services),
                                  title: Text('Services'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, AppRoutes.services);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.work),
                                  title: Text('Portfolio'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, AppRoutes.portfolio);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text('About'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, AppRoutes.about);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.contact_mail),
                                  title: Text('Contact'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, AppRoutes.contact);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.work),
                                  title: Text('Hire Me'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    _showHireMeBottomSheet(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
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
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColorConstants.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => Stack(
      children: [
        HireMeBottomSheet(recipientEmail: recipientEmail),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: Icon(Icons.close, color: AppColorConstants.gray600),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    ),
  );
}
}