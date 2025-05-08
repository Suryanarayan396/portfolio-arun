
// widgets/portfolio_card.dart - Individual portfolio card
import 'package:flutter/material.dart';
import 'package:webportf/constants/app_color_constants.dart';

class PortfolioCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isAsset;

  const PortfolioCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.isAsset = true, // Default to using assets
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorConstants.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: AppColorConstants.shadowLight, blurRadius: 8)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            // Image that fills the entire card
            isAsset
              ? Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
              : Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

            // Gradient overlay for better text visibility
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColorConstants.transparent,
                      AppColorConstants.transparent,
                      AppColorConstants.black.withAlpha(25),
                      AppColorConstants.black.withAlpha(128),
                    ],
                    stops: const [0.0, 0.6, 0.8, 1.0],
                  ),
                ),
              ),
            ),

            // Text overlay in bottom right
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                width: 180,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColorConstants.black.withAlpha(179),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColorConstants.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColorConstants.white.withAlpha(179),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
