import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  static Future<void> sendEmail({
    required String recipientEmail,
    required String subject,
    required String body,
    required String senderEmail,
    required String senderPassword,
    String? senderName,
  }) async {
    // Configure mail server (Gmail example)
    final smtpServer = gmail(senderEmail, senderPassword);
    
    // Create the email message
    final message = Message()
      ..from = Address(senderEmail, senderName ?? 'Portfolio Website')
      ..recipients.add(recipientEmail)
      ..subject = subject
      ..text = body;
    
    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Email sent: ${sendReport.toString()}');
    } catch (e) {
      print('Error sending email: $e');
      throw e;
    }
  }
}