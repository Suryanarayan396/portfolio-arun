
// widgets/contact_section.dart - Contact information
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webportf/apptheme.dart';


class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          // Contact buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.phone, color: Colors.white),
                label: Text('Call Me', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Replace with your actual phone number
                  const phoneNumber = 'tel:+918129445562';
                  launchUrl(Uri.parse(phoneNumber));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: AppTheme.secondaryColor,
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.email, color: Colors.white),
                label: Text('Email Me', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Replace with your actual email
                  final emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'your.email@example.com',
                    queryParameters: {
                      'subject': 'Contact from App',
                      'body': 'Hello, I would like to contact you about...'
                    },
                  );
                  launchUrl(emailLaunchUri);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: AppTheme.secondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
