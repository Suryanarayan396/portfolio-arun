import 'package:flutter/material.dart';
import 'package:webportf/sections/servicesection.dart';
import 'package:webportf/widgets/appbar_widget.dart';

import '../widgets/footer_widget.dart';

class ServicesPage extends StatelessWidget {
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
                ServicesSection(),
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
