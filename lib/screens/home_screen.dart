import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildServicesOverview(context),
            _buildWhyChooseUs(context),
            _buildTestimonials(context),
            _buildCallToAction(context),
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
      height: isMobile ? 400 : 500,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Professional Security & Manpower Solutions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 28 : 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Trusted partner for comprehensive staffing, labour contracting, and security services',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isMobile ? 16 : 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Hire Staff'),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () => context.go('/careers'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Apply for Job'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServicesOverview(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            childAspectRatio: isMobile ? 2.5 : 1.2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildServiceCard(
                Icons.people,
                'Manpower Supply',
                'Skilled and unskilled workers for all industries',
              ),
              _buildServiceCard(
                Icons.construction,
                'Labour Contracting',
                'Complete labour solutions for construction projects',
              ),
              _buildServiceCard(
                Icons.security,
                'Security Services',
                'Professional security guards and surveillance',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
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
                fontSize: 18,
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

  Widget _buildWhyChooseUs(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Why Choose Us',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              if (!isMobile) ...[
                Expanded(
                  child: Icon(
                    Icons.verified_user,
                    size: 200,
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                ),
                const SizedBox(width: 40),
              ],
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFeatureItem('✓ 10+ Years of Experience'),
                    _buildFeatureItem('✓ Verified & Trained Staff'),
                    _buildFeatureItem('✓ 24/7 Customer Support'),
                    _buildFeatureItem('✓ Competitive Pricing'),
                    _buildFeatureItem('✓ Pan-India Services'),
                    _buildFeatureItem('✓ Quick Deployment'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildTestimonials(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'What Our Clients Say',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            childAspectRatio: isMobile ? 1.5 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildTestimonialCard(
                'Excellent service and professional staff. They provided exactly what we needed for our construction project.',
                'ABC Construction Ltd.',
              ),
              _buildTestimonialCard(
                'Reliable security services for our office complex. Highly recommended for their professionalism.',
                'XYZ Corporate Park',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String testimonial, String client) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.format_quote,
              size: 32,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                testimonial,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '- $client',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Ready to Get Started?',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Contact us today for your manpower and security needs',
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 16 : 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => context.go('/contact'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 16,
              ),
            ),
            child: const Text('Contact Us Now'),
          ),
        ],
      ),
    );
  }
}