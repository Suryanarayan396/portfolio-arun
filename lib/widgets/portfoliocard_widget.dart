
// widgets/portfolio_card.dart - Individual portfolio card
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webportf/constants/app_color_constants.dart';

class PortfolioCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? url;
  final String projectcontent;
  final bool isAsset;

  const PortfolioCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.url,
    this.isAsset = true, required this.projectcontent, // Default to using assets
  });

  // Method to launch URL
  Future<void> _launchUrl() async {
    if (url != null && url!.isNotEmpty) {
      final Uri uri = Uri.parse(url!);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: url != null && url!.isNotEmpty ? _launchUrl : null,
        borderRadius: BorderRadius.circular(12),
        hoverColor: AppColorConstants.black.withValues(alpha: 0.05),
        splashColor: AppColorConstants.black.withValues(alpha: 0.1),
        child: Container(
          decoration: BoxDecoration(
            color: AppColorConstants.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColorConstants.shadowLight,
                blurRadius: 12,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
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

                // Clickable indicator icon (top right)
                if (url != null && url!.isNotEmpty)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColorConstants.white.withAlpha(230),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColorConstants.black.withAlpha(51),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: AppColorConstants.black.withAlpha(179),
                      ),
                    ),
                  ),

                // Text overlay in bottom left (redesigned)
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColorConstants.white.withAlpha(240),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColorConstants.black.withAlpha(51),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColorConstants.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          url != null && url!.isNotEmpty
                              ? projectcontent
                              : 'Project showcase',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColorConstants.black.withAlpha(153),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
