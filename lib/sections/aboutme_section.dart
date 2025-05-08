
// widgets/about_section.dart - About me section
import 'package:flutter/material.dart';
import 'package:webportf/apptheme.dart';
import 'package:webportf/model/skill_data_model.dart';
import 'package:webportf/widgets/skill_indicator_widget.dart';


class AboutSection extends StatelessWidget {
  final List<Skill> skills = [
    Skill(name: 'Figma', percentage: 100),
    Skill(name: 'Adobe XD', percentage: 100),
    Skill(name: 'Photoshop', percentage: 90),
    Skill(name: 'Illustrator', percentage: 70),
    Skill(name: 'Premiere Pro', percentage: 60),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text('About Me',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                isMobile
                    ? Column(
                        children: [
                          CircleAvatar(
                            radius: 75,
                            backgroundImage: NetworkImage(
                                'https://storage.googleapis.com/a1aa/image/mJA_aTS_SYMtyqEqOzgMihOekgR8mT7FTxLQqc_q0cE.jpg'),
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {}, child: Text('Read More')), ElevatedButton(
                                    onPressed: () {}, child: Text('Download Resume')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 75,
                            backgroundImage: NetworkImage(
                                'https://storage.googleapis.com/a1aa/image/mJA_aTS_SYMtyqEqOzgMihOekgR8mT7FTxLQqc_q0cE.jpg'),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: isTablet ? 300 : 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {}, child: Text('Read More')),SizedBox(width: 15,),ElevatedButton(
                                    onPressed: () {}, child: Text('Download Resume')),
                                  ],
                                ), 
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          SizedBox(height: 32),
          isMobile
              ? Column(
                  children: skills.map((skill) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: CircularSkillIndicator(
                        skill: skill.name,
                        percentage: skill.percentage,
                      ),
                    );
                  }).toList(),
                )
              : Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: skills.map((skill) => CircularSkillIndicator(
                    skill: skill.name,
                    percentage: skill.percentage,
                  )).toList(),
                ),
        ],
      ),
    );
  }
}
