
// routes/app_routes.dart - Navigation routes configuration
import 'package:flutter/material.dart';
import 'package:webportf/homepage.dart';
import 'package:webportf/pages/AboutPage.dart';
import 'package:webportf/pages/ContactPage.dart';
import 'package:webportf/pages/PortfolioPage.dart';
import 'package:webportf/pages/service_page.dart';


class AppRoutes {
  static const String home = '/';
  static const String services = '/services';
  static const String portfolio = '/portfolio';
  static const String about = '/about';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    services: (context) => ServicesPage(),
    portfolio: (context) => PortfolioPage(),
    about: (context) => AboutPage(),
    contact: (context) => ContactPage(),
  };
}
