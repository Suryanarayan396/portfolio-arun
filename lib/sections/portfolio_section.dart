
// widgets/portfolio_section.dart - Portfolio showcase
import 'package:flutter/material.dart';
import 'package:webportf/model/portfolio_item_model.dart';
import 'package:webportf/widgets/portfoliocard_widget.dart';


class PortfolioSection extends StatelessWidget {
  final List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      imageUrl: 'assets/png/Landing page.png',
      title: 'Project 1'
    ),
    PortfolioItem(
      imageUrl: 'assets/png/Mobile APP design.png',
      title: 'Project 2'
    ),
    PortfolioItem(
      imageUrl: 'assets/png/Mobile APP design2.png',
      title: 'Project 3'
    ),
    PortfolioItem(
      imageUrl: 'assets/png/Freshday cart automation.png',
      title: 'Project 4'
    ),
    PortfolioItem(
      imageUrl: 'assets/png/Graphic design.png',
      title: 'Project 5'
    ),
    PortfolioItem(
      imageUrl: 'assets/png/product desiging thumbnail.png',
      title: 'Project 6'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Text('Portfolio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: isMobile ? 1.0 : 1.1, // Adjusted for better image display
            mainAxisSpacing: 24, // Increased spacing
            crossAxisSpacing: 24, // Increased spacing
            padding: EdgeInsets.all(16),
            children: portfolioItems.map((item) => PortfolioCard(
              imageUrl: item.imageUrl,
              title: item.title,
              isAsset: true,
            )).toList(),
          ),
          SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: Text('See More')),
        ],
      ),
    );
  }
}
