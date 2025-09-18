import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../utils/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildCompanyInfo(context),
            _buildMissionVision(context),
            _buildTeamSection(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.accent,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your Trusted Security & Manpower Partner',
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 16 : 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Our Story',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Globally Brilliant Security 1 2 Z Services has been a leading provider of comprehensive manpower, labour, and security solutions for over a decade. Founded with the vision of delivering excellence in human resource management, we have grown to become a trusted partner for businesses across various industries.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Our commitment to quality, reliability, and professionalism has earned us the trust of numerous clients, from small businesses to large corporations. We pride ourselves on understanding our clients\' unique needs and providing tailored solutions that exceed expectations.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMissionVision(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            childAspectRatio: isMobile ? 1.5 : 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildMissionCard(
                Icons.flag,
                'Our Mission',
                'To provide exceptional manpower and security services that enable our clients to focus on their core business while ensuring safety and efficiency.',
              ),
              _buildMissionCard(
                Icons.visibility,
                'Our Vision',
                'To be the most trusted and reliable partner in the manpower and security industry, setting new standards of excellence and innovation.',
              ),
              _buildMissionCard(
                Icons.favorite,
                'Our Values',
                'Integrity, professionalism, reliability, and customer satisfaction are the core values that drive everything we do.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard(IconData icon, String title, String description) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Our Leadership',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Our experienced leadership team brings together decades of expertise in security, human resources, and business management to deliver exceptional results for our clients.',
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            childAspectRatio: isMobile ? 1.2 : 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildTeamMember(
                'Managing Director',
                '15+ years in security industry',
              ),
              _buildTeamMember(
                'Operations Head',
                'Expert in manpower management',
              ),
              _buildTeamMember(
                'HR Director',
                'Specialist in recruitment & training',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String position, String description) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              position,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}