
// widgets/contact_section.dart - Contact information
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webportf/apptheme.dart';


class ContactSection extends StatefulWidget {
  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _companyController = TextEditingController();
  final _contextController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _companyController.dispose();
    _contextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFC), // Very light blue-gray
            Color(0xFFF1F5F9), // Slightly darker blue-gray
            Color(0xFFE2E8F0), // Light gray-blue
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 60, horizontal: 16),
      child: Column(
        children: [
          // Elegant title with subtle animation effect
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Let\'s Create Together',
              style: TextStyle(
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.w300,
                color: Color(0xFF1E293B),
                letterSpacing: 1.2,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: isMobile ? 60 : 80,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.secondaryColor.withValues(alpha: 0.3),
                  AppTheme.secondaryColor,
                  AppTheme.secondaryColor.withValues(alpha: 0.3),
                ],
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          SizedBox(height: 24),
          Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: Text(
              'I\'m always excited to hear about new projects, ideas, or opportunities. Whether you\'re looking to hire a passionate UI/UX designer, have a freelance project in mind, or simply want to collaborate — feel free to drop me a message. I’d love to be part of something great!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 15 : 17,
                color: Color(0xFF475569),
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 50),

          // Hiring Section - Responsive Layout
          _buildHiringSection(context, isMobile),

          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHiringSection(BuildContext context, bool isMobile) {
    if (isMobile) {
      // Mobile: Column layout
      return Column(
        children: [
          _buildContactForm(isMobile),
          SizedBox(height: 24),
          _buildContactInfo(isMobile),
        ],
      );
    } else {
      // Desktop: Row layout
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _buildContactForm(isMobile),
          ),
          SizedBox(width: 32),
          Expanded(
            flex: 2,
            child: _buildContactInfo(isMobile),
          ),
        ],
      );
    }
  }

  Widget _buildContactForm(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                'Send Message',
                style: TextStyle(
                  fontSize: isMobile ? 22 : 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Container(
              width: 40,
              height: 2,
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            SizedBox(height: 24),

            // Name Field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                filled: true,
                fillColor: Color(0xFFF8FAFC),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              style: TextStyle(
                fontSize: isMobile ? 15 : 16,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.w400,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Contact Number and Company Name Fields - Responsive Layout
            if (isMobile)
              Column(
                children: [
                  // Contact Number Field (Mobile)
                  TextFormField(
                    controller: _contactController,
                    decoration: InputDecoration(
                      labelText: 'Contact Number*',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Company Name Field (Mobile)
                  TextFormField(
                    controller: _companyController,
                    decoration: InputDecoration(
                      labelText: 'Company Name',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ],
              )
            else
              // Desktop: Row layout for Contact Number and Company Name
              Row(
                children: [
                  // Contact Number Field (Desktop)
                  Expanded(
                    child: TextFormField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your contact number';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),

                  // Company Name Field (Desktop)
                  Expanded(
                    child: TextFormField(
                      controller: _companyController,
                      decoration: InputDecoration(
                        labelText: 'Company Name',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 16),

            // Context/Message Field
            TextFormField(
              controller: _contextController,
              decoration: InputDecoration(
                labelText: 'Message',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                alignLabelWithHint: true,
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            // Send Message Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: _isSubmitting
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Icon(Icons.send, color: Colors.white),
                label: Text(
                  _isSubmitting ? 'Sending...' : 'Send Message',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _isSubmitting ? null : _sendMessage,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppTheme.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Color(0xFFFAFBFC),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'Ready to Hire?',
              style: TextStyle(
                fontSize: isMobile ? 22 : 26,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
                letterSpacing: 0.5,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
          Container(
            width: 40,
            height: 2,
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor,
              borderRadius: BorderRadius.circular(1),
            ),
            margin: EdgeInsets.only(bottom: 16),
          ),
          Text(
            'I\'m currently available for freelance projects and full-time opportunities. Let\'s discuss how I can help bring your vision to life with exceptional UI/UX design.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.grey[700],
              height: 1.5,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          SizedBox(height: 20),

          Text(
            'Direct Contact',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),

          if (isMobile)
            Column(
              children: [
                _buildContactButton(
                  icon: Icons.phone,
                  label: 'Call Me',
                  onPressed: () {
                    const phoneNumber = 'tel:+918129979506';
                    launchUrl(Uri.parse(phoneNumber));
                  },
                ),
                SizedBox(height: 12),
                _buildContactButton(
                  icon: Icons.email,
                  label: 'Email Me',
                  onPressed: () {
                    final emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'akpk369@gmail.com',
                      queryParameters: {
                        'subject': 'Contact from Portfolio',
                        'body': 'Hello, I would like to get in touch...'
                      },
                    );
                    launchUrl(emailLaunchUri);
                  },
                ),
              ],
            )
          else
            // Tablet and Desktop: Row layout for contact buttons
            Row(
              children: [
                Expanded(
                  child: _buildContactButton(
                    icon: Icons.phone,
                    label: 'Call Me',
                    onPressed: () {
                      const phoneNumber = 'tel:+918129979506';
                      launchUrl(Uri.parse(phoneNumber));
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildContactButton(
                    icon: Icons.email,
                    label: 'Email Me',
                    onPressed: () {
                      final emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'akpk369@gmail.com',
                        queryParameters: {
                          'subject': 'Contact from Portfolio',
                          'body': 'Hello, I would like to get in touch...'
                        },
                      );
                      launchUrl(emailLaunchUri);
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        // Construct email subject and content
        final emailSubject = 'New Contact Message from ${_nameController.text}';
        final emailContent = '''
Contact Details:
Name: ${_nameController.text}
Contact Number: ${_contactController.text}
Company: ${_companyController.text.isNotEmpty ? _companyController.text : 'Not specified'}

Message:
${_contextController.text}

---
This message was sent from the portfolio contact form.
        ''';

        final emailLaunchUri = Uri(
          scheme: 'mailto',
          path: 'akpk369@gmail.com',
          queryParameters: {
            'subject': emailSubject,
            'body': emailContent,
          },
        );

        await launchUrl(emailLaunchUri);

        // Show success message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Email client opened successfully!'),
              backgroundColor: AppTheme.secondaryColor,
            ),
          );

          // Clear form
          _nameController.clear();
          _contactController.clear();
          _companyController.clear();
          _contextController.clear();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error opening email client. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    }
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.secondaryColor,
            AppTheme.secondaryColor.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.secondaryColor.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 18),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
