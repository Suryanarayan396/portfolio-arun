
// Updated main.dart with routes
import 'package:flutter/material.dart';

import 'package:webportf/AppRoutes.dart';
import 'package:webportf/apptheme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}





// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Portfolio',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         textTheme: TextTheme(
//           bodyMedium: TextStyle(color: Colors.grey[600]),
//         ),
//       ),
//       home: PortfolioPage(),
//     );
//   }
// }

// class PortfolioPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;
//     final isTablet = screenWidth >= 600 && screenWidth < 1200;

//     return Scaffold(backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 //appbar section
//                 Container(
//                   decoration: BoxDecoration(color: Color(0xff5F00BA),borderRadius: BorderRadius.circular(10)),
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Logo',
//                           style: TextStyle(color: Colors.white, fontSize: 20)),
//                       Row(
//                         children: isMobile
//                             ? [
//                                 IconButton(
//                                   icon: Icon(Icons.menu, color: Colors.white),
//                                   onPressed: () {
//                                     // Mobile menu implementation would go here
//                                   },
//                                 )
//                               ]
//                             : [
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text('Home',
//                                         style: TextStyle(color: Colors.white))),
//                                 SizedBox(width: 16),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text('Services',
//                                         style: TextStyle(color: Colors.white))),
//                                 SizedBox(width: 16),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text('Portfolio',
//                                         style: TextStyle(color: Colors.white))),
//                                 SizedBox(width: 16),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text('Contact',
//                                         style: TextStyle(color: Colors.white))),
//                                 SizedBox(width: 16),
//                                 ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.white,
//                                       foregroundColor: Colors.purple[700],
//                                     ),
//                                     onPressed: () {},
//                                     child: Text('Hire Me')),
//                               ],
//                       ),
//                     ],
//                   ),
//                 ),
//         SizedBox(height: 50,),
//                 //hero section
//                 Container(
//                    height: isMobile ? 400 : isTablet ? 500 : 1200,width: double.infinity,
//                   padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
//                   decoration: BoxDecoration(
//                   image: DecorationImage(
//         image: AssetImage('assets/images/arun poster.png'),
//         // Adjust the fit based on your preference
//         fit: BoxFit.cover, // or BoxFit.contain depending on your needs
//         alignment: Alignment.center,
//             ),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'HI I\'M Jenny Wilson',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: isMobile ? 24 : 32,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 16),   
//                       Wrap(
//               spacing: 16,
//               runSpacing: 16,
//               alignment: WrapAlignment.center,
//               children: [
//                 SocialIcon(
//                   icon: FontAwesomeIcons.instagram,
//                   url: 'https://instagram.com',
//                 ),
//                 SocialIcon(
//                   icon: FontAwesomeIcons.linkedin,
//                   url: 'https://linkedin.com',
//                 ),
//                 SocialIcon(
//                   icon: FontAwesomeIcons.behance,
//                   url: 'https://behance.net',
//                 ),
//                 SocialIcon(
//                   icon: FontAwesomeIcons.dribbble,
//                   url: 'https://dribbble.com',
//                 ),
//               ],
//             ),
                    
//                     ],
//                   ),
//                 ),
//                 // Services Section
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                   child: Column(
//                     children: [
//                       Text('Services',
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 8),
//                       Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 16),
//                       isMobile
//                           ? Column(
//                               children: [
//                                 ServiceCard(
//                                     icon: Icons.brush,
//                                     title: 'Landing Page Design',
//                                     description:
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                                 SizedBox(height: 16),
//                                 ServiceCard(
//                                     icon: Icons.phone_android,
//                                     title: 'Mobile App Design',
//                                     description:
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                                     isHighlighted: true),
//                                 SizedBox(height: 16),
//                                 ServiceCard(
//                                     icon: Icons.web,
//                                     title: 'Website Design',
//                                     description:
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                               ],
//                             )
//                           : isTablet
//                               ? Wrap(
//                                   spacing: 16,
//                                   runSpacing: 16,
//                                   alignment: WrapAlignment.center,
//                                   children: [
//                                     ServiceCard(
//                                         icon: Icons.brush,
//                                         title: 'Landing Page Design',
//                                         description:
//                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                                     ServiceCard(
//                                         icon: Icons.phone_android,
//                                         title: 'Mobile App Design',
//                                         description:
//                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                                         isHighlighted: true),
//                                     ServiceCard(
//                                         icon: Icons.web,
//                                         title: 'Website Design',
//                                         description:
//                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                                   ],
//                                 )
//                               : Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     ServiceCard(
//                                         icon: Icons.brush,
//                                         title: 'Landing Page Design',
//                                         description:
//                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                                     SizedBox(width: 16),
//                                     ServiceCard(
//                                         icon: Icons.phone_android,
//                                         title: 'Mobile App Design',
//                                         description:
//                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                                         isHighlighted: true),
//                                     SizedBox(width: 16),
//                                     ServiceCard(
//                                         icon: Icons.web,
//                                         title: 'Website Design',
//                                         description:
//                                             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                                   ],
//                                 ),
//                     ],
//                   ),
//                 ),
//                 // About Me Section
//             Container(
//   width: double.infinity,
//   decoration: BoxDecoration(color: Color(0xff5F00BA),borderRadius: BorderRadius.circular(10)),
//   padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//   child: Column(
//     children: [
//      Container(padding: EdgeInsets.all(20),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
//       child: Column(children: [ Text('About Me',
//           style: TextStyle(
//               fontSize: 24, fontWeight: FontWeight.bold)),
//       SizedBox(height: 16),
//       isMobile
//           ? Column(
//               children: [
//                 CircleAvatar(
//                   radius: 75,
//                   backgroundImage: NetworkImage(
//                       'https://storage.googleapis.com/a1aa/image/mJA_aTS_SYMtyqEqOzgMihOekgR8mT7FTxLQqc_q0cE.jpg'),
//                 ),
//                 SizedBox(height: 16),
//                 Container(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 8),
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: Text('Read More')),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 75,
//                   backgroundImage: NetworkImage(
//                       'https://storage.googleapis.com/a1aa/image/mJA_aTS_SYMtyqEqOzgMihOekgR8mT7FTxLQqc_q0cE.jpg'),
//                 ),
//                 SizedBox(width: 16),
//                 Container(
//                   width: isTablet ? 300 : 400,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
//                       SizedBox(height: 8),
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: Text('Read More')),
//                     ],
//                   ),
//                 ),
//               ],
//             ),],),),
//       SizedBox(height: 32),
//       isMobile
//           ? Column(
//               children: [
//                 CircularSkillIndicator(skill: 'Figma', percentage: 100,),
//                 SizedBox(height: 12),
//                 CircularSkillIndicator(skill: 'Adobe XD', percentage: 100,),
//                 SizedBox(height: 12),
//                 CircularSkillIndicator(skill: 'Photoshop', percentage: 90,),
//                 SizedBox(height: 12),
//                 CircularSkillIndicator(skill: 'Illustrator', percentage: 70,),
//                 SizedBox(height: 12),
//                 CircularSkillIndicator(skill: 'Premiere Pro', percentage: 60,),
//               ],
//             )
//           : Wrap(
//               spacing: 24,
//               runSpacing: 24,
//               alignment: WrapAlignment.center,
//               children: [
//                 CircularSkillIndicator(skill: 'Figma', percentage: 100,),
//                 CircularSkillIndicator(skill: 'Adobe XD', percentage: 100,),
//                 CircularSkillIndicator(skill: 'Photoshop', percentage: 90,),
//                 CircularSkillIndicator(skill: 'Illustrator', percentage: 70,),
//                 CircularSkillIndicator(skill: 'Premiere Pro', percentage: 60,),
//               ],
//             ),
//     ],
//   ),
// ),
//                 // Portfolio Section
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                   child: Column(
//                     children: [
//                       Text('Portfolio',
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 8),
//                       Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 16),
//                       GridView.count(
//                         crossAxisCount: isMobile
//                             ? 1
//                             : isTablet
//                                 ? 2
//                                 : 3,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         childAspectRatio: isMobile ? 1.2 : 0.8,
//                         mainAxisSpacing: 16,
//                         crossAxisSpacing: 16,
//                         padding: EdgeInsets.all(8),
//                         children: [
//                           PortfolioCard(
//                               imageUrl:
//                                   'https://storage.googleapis.com/a1aa/image/_LRIGHmSlFrUcAvy8ewiq-jYCtCRIgyV2FvGzAFjyFw.jpg',
//                               title: 'Project 1'),
//                           PortfolioCard(
//                               imageUrl:
//                                   'https://storage.googleapis.com/a1aa/image/tCl6nZIMhwNNatf6SeGAhfDC_Na3g9eGSJucw1kyN4I.jpg',
//                               title: 'Project 2'),
//                           PortfolioCard(
//                               imageUrl:
//                                   'https://storage.googleapis.com/a1aa/image/ylkO3bMf5N10jXyqbfDS4iPZ7S1l2fqsehEXV9kHVAs.jpg',
//                               title: 'Project 3'),
//                           PortfolioCard(
//                               imageUrl:
//                                   'https://storage.googleapis.com/a1aa/image/oNze5AHK0OGt5Y-iU1f7kS1se2b0UjGliJmMWUyHp_Q.jpg',
//                               title: 'Project 4'),
//                           PortfolioCard(
//                               imageUrl:
//                                   'https://storage.googleapis.com/a1aa/image/EhA08UZh5xUqSipiC59lpdCfPnfYTTb9OGC1xyYB2Pk.jpg',
//                               title: 'Project 5'),
//                           PortfolioCard(
//                               imageUrl:
//                                   'https://storage.googleapis.com/a1aa/image/m9MkP7AzWLX4s4Nx0lLAp5SZWzxHhn9fMG4WoueYy2o.jpg',
//                               title: 'Project 6'),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//                       ElevatedButton(onPressed: () {}, child: Text('See More')),
//                     ],
//                   ),
//                 ),
//                 // Contact Section
//              Container(
//           width: double.infinity,
//           color: Colors.grey[200],
//           padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//           child: Column(
//             children: [
//         Text(
//           'Contact Me',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 16),
//         Text(
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: 24),
//         // Contact buttons row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//               icon: Icon(Icons.phone,color: Colors.white),
//               label: Text('Call Me',style: TextStyle(color: Colors.white),),
//               onPressed: () {
//                 // Replace with your actual phone number
//                 const phoneNumber = 'tel:+918129445562';
//                 launchUrl(Uri.parse(phoneNumber));
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 backgroundColor: Color(0xff7E1EFF),
//               ),
//             ),
//             SizedBox(width: 16),
//             ElevatedButton.icon(
//               icon: Icon(Icons.email,color: Colors.white,),
//               label: Text('Email Me',style: TextStyle(color: Colors.white),),
//               onPressed: () {
//                 // Replace with your actual email
//                 final emailLaunchUri = Uri(
//                   scheme: 'mailto',
//                   path: 'your.email@example.com',
//                   queryParameters: {
//                     'subject': 'Contact from App',
//                     'body': 'Hello, I would like to contact you about...'
//                   },
//                 );
//                 launchUrl(emailLaunchUri);
//               },
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 backgroundColor: Color(0xff7E1EFF),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 24),
        
//             ],
//           ),
//         ),
//                 // Footer
//                 Container(
//                   width: double.infinity,
//                   color: Color(0xff7E1EFF),
//                   padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                   child: Column(
//                     children: [
//                       Text('Logo',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold)),
//                       SizedBox(height: 8),
//                       Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//                         style: TextStyle(color: Colors.white),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 16),
//                       isMobile
//                           ? Column(
//                               children: [
//                                 FooterColumn(title: 'Home', items: [
//                                   'Home',
//                                   'Services',
//                                   'Portfolio',
//                                   'Contact'
//                                 ]),
//                                 SizedBox(height: 16),
//                                 FooterColumn(title: 'Services', items: [
//                                   'Landing Page Design',
//                                   'Mobile App Design',
//                                   'Website Design'
//                                 ]),
//                                 SizedBox(height: 16),
//                                 FooterColumn(
//                                     title: 'Contact',
//                                     items: ['Email', 'Phone', 'Address']),
//                               ],
//                             )
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 FooterColumn(title: 'Home', items: [
//                                   'Home',
//                                   'Services',
//                                   'Portfolio',
//                                   'Contact'
//                                 ]),
//                                 SizedBox(width: 32),
//                                 FooterColumn(title: 'Services', items: [
//                                   'Landing Page Design',
//                                   'Mobile App Design',
//                                   'Website Design'
//                                 ]),
//                                 SizedBox(width: 32),
//                                 FooterColumn(
//                                     title: 'Contact',
//                                     items: ['Email', 'Phone', 'Address']),
//                               ],
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ServiceCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final bool isHighlighted;

//   ServiceCard(
//       {required this.icon,
//       required this.title,
//       required this.description,
//       this.isHighlighted = false});

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(maxWidth: 300),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: isHighlighted ? Color(0xff5F00BA) : Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
//         ),
//         child: Column(
//           children: [
//             Icon(icon,
//                 size: 48,
//                 color: isHighlighted ? Colors.white : Colors.purple[700]),
//             SizedBox(height: 8),
//             Text(title,
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: isHighlighted ? Colors.white : Colors.black)),
//             SizedBox(height: 8),
//             Text(description,
//                 style: TextStyle(
//                     color: isHighlighted ? Colors.white : Colors.grey[600])),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SkillIndicator extends StatelessWidget {
//   final String skill;
//   final int percentage;

//   SkillIndicator({required this.skill, required this.percentage});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               width: 80,
//               height: 80,
//               child: CircularProgressIndicator(
//                 value: percentage / 100,
//                 strokeWidth: 8,
//                 backgroundColor: Colors.grey[300],
//                 valueColor: AlwaysStoppedAnimation(Colors.purple[700]!),
//               ),
//             ),
//             Text('$percentage%',
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple[700])),
//           ],
//         ),
//         SizedBox(height: 8),
//         Text(skill, style: TextStyle(color: Colors.grey[600])),
//       ],
//     );
//   }
// }

// class PortfolioCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;

//   PortfolioCard({required this.imageUrl, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
//       ),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(4),
//             child: Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//               height: 200,
//               width: double.infinity,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(title,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 8),
//           Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//               style: TextStyle(color: Colors.grey[600])),
//         ],
//       ),
//     );
//   }
// }

// class FooterColumn extends StatelessWidget {
//   final String title;
//   final List<String> items;

//   FooterColumn({required this.title, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(title,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold)),
//         SizedBox(height: 8),
//         ...items.map((item) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: Text(item, style: TextStyle(color: Colors.white)),
//             )),
//       ],
//     );
//   }
// }

// class SocialIcon extends StatefulWidget {
//   final IconData icon;
//   final String url;

//   const SocialIcon({Key? key, required this.icon, required this.url}) : super(key: key);

//   @override
//   _SocialIconState createState() => _SocialIconState();
// }

// class _SocialIconState extends State<SocialIcon> {
//   bool _hovering = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hovering = true),
//       onExit: (_) => setState(() => _hovering = false),
//       child: AnimatedScale(
//         scale: _hovering ? 1.15 : 1.0,
//         duration: const Duration(milliseconds: 200),
//         child: InkWell(
//           onTap: () {
//             // Handle tap, e.g., launch URL
//           },
//           borderRadius: BorderRadius.circular(30),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             padding: const EdgeInsets.all(14),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               boxShadow: _hovering
//                   ? [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, 4),
//                       ),
//                     ]
//                   : [],
//             ),
//             child: Icon(
//               widget.icon,
//               color: const Color(0xFF5F00BA),
//               size: 20,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class CircularSkillIndicator extends StatelessWidget {
//   final String skill;
//   final double percentage;
//   final double size;
//   final Color backgroundColor;


//   const CircularSkillIndicator({
//     Key? key,
//     required this.skill,
//     required this.percentage,
//     this.size = 100,
//     this.backgroundColor=const Color(0xffffffff), 
//     // this.backgroundColor = const Color(0xff5F00BA), // Purple background
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: size + 40,
//           height: size + 60,
//           decoration: BoxDecoration(
//             color: backgroundColor, // Purple background
//             borderRadius: BorderRadius.circular(24),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: size,
//                 height: size,
//                 child: CustomPaint(
//                   painter: DashedCircularPainter(
//                     percentage: percentage,
//                     activeColor: Color(0xff5F00BA),
//                     inactiveColor: Colors.grey[400]!,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '$percentage%',
//                       style: TextStyle(
//                         fontSize: size * 0.25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 skill,
//                 style: TextStyle(
//                   fontSize: size * 0.2,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class DashedCircularPainter extends CustomPainter {
//   final double percentage;
//   final Color activeColor;
//   final Color inactiveColor;
//   final int segments;

//   DashedCircularPainter({
//     required this.percentage,
//     required this.activeColor,
//     required this.inactiveColor,
//     this.segments = 10,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final strokeWidth = size.width * 0.08;
//     final radius = (size.width / 2) - strokeWidth / 2;
//     final center = Offset(size.width / 2, size.height / 2);

//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.butt;

//     final anglePerSegment = 2 * pi / segments;
//     final gapSize = 0.07;
//     final paintedSegments = (segments * (percentage / 100)).floor();

//     for (int i = 0; i < segments; i++) {
//       paint.color = i < paintedSegments ? activeColor : inactiveColor;
//       double startAngle = i * anglePerSegment + gapSize;
//       double sweepAngle = anglePerSegment - gapSize * 2;

//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
