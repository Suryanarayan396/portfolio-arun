import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:email_validator/email_validator.dart';
import 'package:webportf/apptheme.dart';

import 'package:webportf/services/email_config.dart';
import 'package:webportf/services/email_service.dart';

class HireMeBottomSheet extends StatefulWidget {
  final String recipientEmail;

  const HireMeBottomSheet({
    Key? key,
    required this.recipientEmail,
  }) : super(key: key);

  @override
  _HireMeBottomSheetState createState() => _HireMeBottomSheetState();
}

class _HireMeBottomSheetState extends State<HireMeBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Schedule an Interview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            
            // Contact Person Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name*',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            
            // Phone Number
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number*',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            
            // Email
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address*',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            
            // Company Name
            TextFormField(
              controller: _companyController,
              decoration: InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business),
              ),
            ),
            SizedBox(height: 12),
            
            // Address
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 12),
            
            // Date Picker
            InkWell(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime.now().add(Duration(days: 365)),
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      _selectedDate == null
                          ? 'Select Interview Date*'
                          : 'Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate!)}',
                      style: TextStyle(
                        color: _selectedDate == null ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            
            // Time Picker
            InkWell(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      _selectedTime == null
                          ? 'Select Interview Time*'
                          : 'Time: ${_selectedTime!.format(context)}',
                      style: TextStyle(
                        color: _selectedTime == null ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            
            // Additional Notes
            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: 'Additional Notes',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.note),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            
            // Submit Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: _isSubmitting ? null : _submitForm,
              child: _isSubmitting
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Submit Request'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select an interview date')),
        );
        return;
      }
      
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select an interview time')),
        );
        return;
      }

      setState(() {
        _isSubmitting = true;
      });

      try {
        // Construct email subject and content
        final emailSubject = 'New Interview Request from ${_nameController.text}';
        final emailContent = '''
Contact Person Details:
Name: ${_nameController.text}
Phone: ${_phoneController.text}
Email: ${_emailController.text}
Company: ${_companyController.text}
Address: ${_addressController.text}

Interview Details:
Date: ${DateFormat('MMMM dd, yyyy').format(_selectedDate!)}
Time: ${_selectedTime!.format(context)}

Additional Notes:
${_notesController.text}
''';

        // For demo purposes and testing, you can use this simulated approach
        // If you don't want to set up email credentials yet
        if (EmailConfig.senderEmail == 'your.sending.email@gmail.com') {
          // Simulating email sending delay for testing
          await Future.delayed(Duration(seconds: 2));
          
          print('Would send email to: ${widget.recipientEmail}');
          print('Subject: $emailSubject');
          print('Content: $emailContent');
        } else {
          // Send actual email if credentials are configured
          await EmailService.sendEmail(
            recipientEmail: widget.recipientEmail,
            subject: emailSubject,
            body: emailContent,
            senderEmail: EmailConfig.senderEmail,
            senderPassword: EmailConfig.senderPassword,
            senderName: EmailConfig.senderName,
          );
        }
        
        // Show success message
        if (mounted) {
          Navigator.pop(context); // Close the bottom sheet
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Interview request submitted successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to submit request: ${e.toString()}'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
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
}