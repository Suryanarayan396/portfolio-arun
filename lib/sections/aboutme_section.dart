// widgets/about_section.dart - About me section
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webportf/apptheme.dart';
import 'package:webportf/model/skill_data_model.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _waveControllers;
  late List<Animation<double>> _waveAnimations;

  final List<Skill> skills = [
    Skill(name: 'Figma', percentage: 95),
    Skill(name: 'Adobe XD', percentage: 90),
    Skill(name: 'Photoshop', percentage: 85),
    Skill(name: 'Illustrator', percentage: 80),
    Skill(name: 'UI/UX Design', percentage: 90),
    Skill(name: 'Software Testing', percentage: 85),
  ];

  @override
  void initState() {
    super.initState();

// Initialize animation controllers for each skill
    _waveControllers = List.generate(
      skills.length,
      (index) => AnimationController(
        duration:
            Duration(milliseconds: 2000 + (index * 200)), // Staggered timing
        vsync: this,
      ),
    );

// Initialize wave animations with different curves for variety
    _waveAnimations = _waveControllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutSine,
      ));
    }).toList();

// Start animations with staggered delays
    for (int i = 0; i < _waveControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        if (mounted) {
          _waveControllers[i].repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _waveControllers) {
      controller.dispose();
    }
    super.dispose();
  }

// Method to download resume
  Future<void> _downloadResume(BuildContext context) async {
    try {
      // Direct Google Drive link to Arun Kumar's resume
      const String resumeUrl =
          'https://drive.google.com/file/d/1HfwFpSl_oa75bKda38uOmv60Yqp5hJ22/view?usp=drivesdk';

      // Convert to direct download link for better user experience
      const String directDownloadUrl =
          'https://drive.google.com/uc?export=download&id=1HfwFpSl_oa75bKda38uOmv60Yqp5hJ22';

      final Uri uri = Uri.parse(directDownloadUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );

        // Show success message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.download_done, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text('Resume download started!'),
                ],
              ),
              backgroundColor: Color(0xFF8B5CF6),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      } else {
        // Fallback to view link if direct download fails
        final Uri viewUri = Uri.parse(resumeUrl);
        if (await canLaunchUrl(viewUri)) {
          await launchUrl(
            viewUri,
            mode: LaunchMode.externalApplication,
          );

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.open_in_new, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('Resume opened in browser'),
                  ],
                ),
                backgroundColor: Color(0xFF7C3AED),
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }
        } else {
          throw Exception('Could not launch resume URL');
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text('Error accessing resume. Please try again.'),
              ],
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFC), // Very light blue-gray
            Color(0xFFF1F5F9), // Slightly darker blue-gray
            Colors.white,
          ],
          stops: [0.0, 0.4, 1.0],
        ),
      ),
      padding:
          EdgeInsets.symmetric(vertical: isMobile ? 40 : 60, horizontal: 20),
      child: Column(
        children: [
// Main About Me Section
          Container(
            constraints: BoxConstraints(maxWidth: 1200),
            padding: EdgeInsets.all(isMobile ? 24 : 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xFFFAFBFC),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                  spreadRadius: 0,
                ),
              ],
              border: Border.all(
                color: Color(0xFFE2E8F0),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
// Elegant section header
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'About Me',
                          style: TextStyle(
                            fontSize: isMobile ? 28 : 36,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF1E293B),
                            letterSpacing: 1.2,
                            height: 1.2,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: isMobile ? 60 : 80,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF8B5CF6).withValues(alpha: 0.3),
                              Color(0xFF8B5CF6),
                              Color(0xFF8B5CF6).withValues(alpha: 0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? 32 : 40),

// Profile and Introduction
                isMobile
                    ? Column(
                        children: [
                          _buildMobileLayout(context,isMobile),
                          const SizedBox(height: 40),
                          _buildWhatIDoSection(isMobile),
                        ],
                      )
                    : _buildDesktopLayoutWithServices(context),
              ],
            ),
          ),

          SizedBox(height: isMobile ? 32 : 40),

// Skills Section
          _buildSkillsSection(isMobile),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context,bool isMobile) {
    return Column(
      children: [
// Profile Image
        Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Container(
              width: 200,
              height: 200,
              color: AppTheme.textwhite,
              child: Image.asset(
                'assets/images/arun_poster-removebg-preview.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

// My Approach Quote Box
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8FAFC),
                Color(0xFFF1F5F9),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFF8B5CF6).withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 15,
                offset: const Offset(0, 5),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.format_quote,
                color: Color(0xFF8B5CF6),
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'I believe that great design isn\'t just how it looks — it\'s how it works. That\'s why I combine creativity with strategy and precision.',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xFF475569),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

// Introduction Text
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'Hi, I\'m ARUN KUMAR P K',
                style: TextStyle(
                  fontSize: isMobile? 18:22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'a passionate and detail-oriented professional with expertise in Graphic Design, UI/UX Design, and Software Testing. I specialize in creating visually compelling and user-centered digital experiences that not only look great but function flawlessly.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  color: Color(0xFF475569),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'With a background that bridges creative design and technical quality assurance, I bring a unique perspective to every project. I design intuitive interfaces and engaging visuals while ensuring that every element is tested for performance, usability, and reliability.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  color: Color(0xFF475569),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

// Action Buttons
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8B5CF6),
                Color(0xFF7C3AED),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF8B5CF6).withValues(alpha: 0.3),
                blurRadius: 12,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _downloadResume(context),
              icon: const Icon(Icons.download_rounded,
                  color: Colors.white, size: 18),
              label: const Text(
                'Download Resume',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayoutWithServices(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
// Left side - Profile Image with Quote and Introduction
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// Profile Image with Quote
                  Column(
                    children: [
// Profile Image
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.backgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: AppTheme.textwhite,
                            child: Image.asset(
                              'assets/images/arun_poster-removebg-preview.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

// My Approach Quote Box
                      Container(
                        width: 240,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color:
                                  AppTheme.primaryColor.withValues(alpha: 0.3)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.format_quote,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'I believe that great design isn\'t just how it looks — it\'s how it works. That\'s why I combine creativity with strategy and precision.',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: Colors.black87,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),

// Introduction Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Hi, I\'m ARUN KUMAR P K',
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'a passionate and detail-oriented professional with expertise in Graphic Design, UI/UX Design, and Software Testing. I specialize in creating visually compelling and user-centered digital experiences that not only look great but function flawlessly.',
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Text(
                          'With a background that bridges creative design and technical quality assurance, I bring a unique perspective to every project. I design intuitive interfaces and engaging visuals while ensuring that every element is tested for performance, usability, and reliability.',
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 18),

// Action Button
                        ElevatedButton.icon(
                          onPressed: () => _downloadResume(context),
                          icon: const Icon(Icons.download, color: Colors.white),
                          label: const Text(
                            'Download Resume',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 40),

// Right side - What I Do Section
        Expanded(
          flex: 1,
          child: _buildWhatIDoSection(false),
        ),
      ],
    );
  }

  Widget _buildWhatIDoSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What I Do',
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        _buildServiceItem(
          'Graphic Design',
          'Brand identities & digital assets',
          Icons.palette_outlined,
          isMobile,
        ),
        const SizedBox(height: 8),
        _buildServiceItem(
          'UI/UX Design',
          'User interfaces with Figma & Adobe XD',
          Icons.design_services_outlined,
          isMobile,
        ),
        const SizedBox(height: 8),
        _buildServiceItem(
          'Software Testing',
          'Quality assurance & testing',
          Icons.bug_report_outlined,
          isMobile,
        ),
      ],
    );
  }

  Widget _buildServiceItem(
      String title, String description, IconData icon, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey[100]!, width: 0.5),
      ),
      child: Row(
        children: [
// Minimalist icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryColor,
              size: 12,
            ),
          ),
          const SizedBox(width: 10),

// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 11,
                    height: 1.2,
                    color: Colors.black54,
                    letterSpacing: -0.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(bool isMobile) {
    return Column(
      children: [
// Elegant skills header
        Column(
          children: [
            Text(
              'Skills & Expertise',
              style: TextStyle(
                fontSize: isMobile ? 24 : 28,
                fontWeight: FontWeight.w300,
                color: AppTheme.primaryColor,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: isMobile ? 80 : 120,
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8B5CF6).withValues(alpha: 0.3),
                    Color(0xFF8B5CF6),
                    Color(0xFF7C3AED),
                    Color(0xFF8B5CF6).withValues(alpha: 0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        SizedBox(height: isMobile ? 24 : 32),
        isMobile
            ? Wrap(
                spacing: 60,
                runSpacing: 25,
                alignment: WrapAlignment.center,
                children: skills
                    .asMap()
                    .entries
                    .map((entry) => _buildMobileSkillIndicator(
                        entry.value.name, entry.value.percentage, entry.key))
                    .toList(),
              )
            : Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: skills
                    .asMap()
                    .entries
                    .map((entry) => _buildModernSkillIndicator(
                        entry.value.name, entry.value.percentage, entry.key))
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildModernSkillIndicator(
      String skillName, double percentage, int index) {
    return AnimatedBuilder(
      animation: _waveAnimations[index],
      builder: (context, child) {
// Create wavy effect by modifying the scale and position
        double scaleEffect =
            1.0 + (_waveAnimations[index].value * 0.05); // Subtle scale

        return Transform.translate(
          offset: Offset(
            math.sin(_waveAnimations[index].value * 2 * math.pi) *
                3, // Horizontal wave
            math.cos(_waveAnimations[index].value * 2 * math.pi + index) *
                2, // Vertical wave with phase offset
          ),
          child: Transform.scale(
            scale: scaleEffect,
            child: Column(
              children: [
// Circular Progress Indicator with wavy glow effect
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8B5CF6).withValues(
                            alpha: 0.3 + (_waveAnimations[index].value * 0.2)),
                        blurRadius: 15 + (_waveAnimations[index].value * 10),
                        spreadRadius: 2 + (_waveAnimations[index].value * 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
// Background circle
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
// Animated progress circle
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          value: percentage / 100,
                          strokeWidth: 8,
                          backgroundColor: Color(0xFFF1F5F9),
                          strokeCap: StrokeCap.round,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.lerp(
                              Color(0xFF8B5CF6),
                              Color(0xFF7C3AED),
                              _waveAnimations[index].value,
                            )!,
                          ),
                        ),
                      ),
// Animated percentage text in center
                      Center(
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: 22 + (_waveAnimations[index].value * 2),
                            fontWeight: FontWeight.bold,
                            color: Color.lerp(
                              Color(0xFF1E293B),
                              Color(0xFF8B5CF6),
                              _waveAnimations[index].value * 0.3,
                            ),
                          ),
                          child: Text('${percentage.toInt()}%'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
// Animated skill name
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.lerp(
                      AppTheme.primaryColor,
                      Color(0xFFF8FAFC),
                      _waveAnimations[index].value * 0.3,
                    ),
                  ),
                  child: Text(
                    skillName,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileSkillIndicator(
      String skillName, double percentage, int index) {
    return AnimatedBuilder(
      animation: _waveAnimations[index],
      builder: (context, child) {
// Create wavy effect for mobile indicators
        double scaleEffect =
            1.0 + (_waveAnimations[index].value * 0.03); // Subtle scale

        return Transform.translate(
          offset: Offset(
            math.sin(_waveAnimations[index].value * 2 * math.pi + index) *
                1.5, // Horizontal wave
            math.cos(_waveAnimations[index].value * 2 * math.pi + index * 0.5) *
                1, // Vertical wave
          ),
          child: Transform.scale(
            scale: scaleEffect,
            child: Column(
              children: [
// Animated Circular Progress Indicator - Reduced size for mobile
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8B5CF6).withValues(
                            alpha: 0.2 + (_waveAnimations[index].value * 0.15)),
                        blurRadius: 8 + (_waveAnimations[index].value * 6),
                        spreadRadius: 1 + (_waveAnimations[index].value * 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
// Background circle
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
// Animated progress circle
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: percentage / 100,
                          strokeWidth: 6,
                          backgroundColor: Color(0xFFF1F5F9),
                          strokeCap: StrokeCap.round,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.lerp(
                              Color(0xFF8B5CF6),
                              Color(0xFF7C3AED),
                              _waveAnimations[index].value,
                            )!,
                          ),
                        ),
                      ),
// Animated percentage text in center
                      Center(
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: 11 + (_waveAnimations[index].value * 1),
                            fontWeight: FontWeight.bold,
                            color: Color.lerp(
                              Color(0xFF1E293B),
                              Color(0xFF8B5CF6),
                              _waveAnimations[index].value * 0.3,
                            ),
                          ),
                          child: Text('${percentage.toInt()}%'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
// Animated skill name
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.lerp(
                      AppTheme.primaryColor,
                      Color(0xFFF8FAFC),
                      _waveAnimations[index].value * 0.3,
                    ),
                  ),
                  child: Text(
                    skillName,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
