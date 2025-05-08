
// models/portfolio_item.dart - Portfolio item data model
class PortfolioItem {
  final String imageUrl;
  final String title;
  final String? description;

  PortfolioItem({
    required this.imageUrl,
    required this.title,
    this.description,
  });
}
