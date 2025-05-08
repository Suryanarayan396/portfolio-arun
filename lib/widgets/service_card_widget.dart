
// widgets/service_card.dart - Individual service card
import 'package:flutter/material.dart';
import 'package:webportf/constants/app_color_constants.dart';


class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: Duration(milliseconds: 200),
        child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        constraints: BoxConstraints(maxWidth: 300, minHeight: 220),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColorConstants.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _isHovered
              ? AppColorConstants.primaryPurple.withAlpha(76)
              : AppColorConstants.gray200,
            width: _isHovered ? 1.5 : 1),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColorConstants.shadowMedium
                  : AppColorConstants.shadowLight,
              blurRadius: _isHovered ? 12 : 8,
              offset: _isHovered ? Offset(0, 4) : Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 48,
              color: AppColorConstants.primaryPurple,
            ),
            SizedBox(height: 12),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColorConstants.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              widget.description,
              style: TextStyle(
                color: AppColorConstants.gray600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
