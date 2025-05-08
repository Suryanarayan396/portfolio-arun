
// screens/contact_page.dart - Dedicated contact page
import 'package:flutter/material.dart';
import 'package:webportf/sections/contact_section.dart';
import 'package:webportf/widgets/appbar_widget.dart';


import '../widgets/footer_widget.dart';

class ContactPage extends StatelessWidget {
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
                SizedBox(height: 30),
                ContactSection(),
                SizedBox(height: 30),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
