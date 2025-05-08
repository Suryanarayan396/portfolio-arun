// screens/home_page.dart - Main page that includes all sections
import 'package:flutter/material.dart';
import 'package:webportf/sections/aboutme_section.dart';
import 'package:webportf/sections/contact_section.dart';
import 'package:webportf/sections/herosection.dart';
import 'package:webportf/sections/portfolio_section.dart';
import 'package:webportf/sections/servicesection.dart';
import 'package:webportf/widgets/appbar_widget.dart';
import 'package:webportf/widgets/footer_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppBarWidget(),
                SizedBox(height: 50),
                HeroSection(),
                ServicesSection(),
                AboutSection(),
                PortfolioSection(),
                ContactSection(),
                 SizedBox(height: 50),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}