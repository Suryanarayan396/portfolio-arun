
// models/portfolio_item.dart - Portfolio item data model
class PortfolioItem {
  final String imageUrl;
  final String title;
  final String? description;
  final String? url; // URL to navigate to when card is tapped

  PortfolioItem({
    required this.imageUrl,
    required this.title,
    this.description,
    this.url,
  });
}
