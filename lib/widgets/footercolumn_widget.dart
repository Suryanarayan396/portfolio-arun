
// widgets/footer_column.dart - Footer column component
import 'package:flutter/material.dart';

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(item, style: TextStyle(color: Colors.white)),
            )),
      ],
    );
  }
}
