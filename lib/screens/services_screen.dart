import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../utils/app_colors.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildServicesGrid(context),
            _buildProcessSection(context),
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
              'Our Services',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Comprehensive Solutions for All Your Needs',
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

  Widget _buildServicesGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            childAspectRatio: isMobile ? 1.2 : 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildServiceCard(
                Icons.people,
                'Manpower Supply',
                'We provide skilled and unskilled workers across various industries including construction, manufacturing, hospitality, and more.',
                [
                  'Construction Workers',
                  'Factory Workers',
                  'Office Staff',
                  'Hospitality Staff',
                  'Technical Personnel',
                ],
              ),
              _buildServiceCard(
                Icons.construction,
                'Labour Contracting',
                'Complete labour contracting solutions for construction and infrastructure projects with experienced project management.',
                [
                  'Construction Projects',
                  'Infrastructure Development',
                  'Project Management',
                  'Equipment Supply',
                  'Quality Assurance',
                ],
              ),
              _buildServiceCard(
                Icons.security,
                'Security Guard Services',
                'Professional security personnel trained to handle various security challenges and ensure safety of your premises.',
                [
                  'Residential Security',
                  'Corporate Security',
                  'Industrial Security',
                  'Event Security',
                  'Personal Protection',
                ],
              ),
              _buildServiceCard(
                Icons.business,
                'Facility Management',
                'Comprehensive facility management services to maintain and operate your buildings efficiently.',
                [
                  'Housekeeping Services',
                  'Maintenance Staff',
                  'Technical Support',
                  'Landscaping',
                  'Waste Management',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String description, List<String> features) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: AppColors.success,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    feature,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Our Process',
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
            crossAxisCount: isMobile ? 1 : 4,
            childAspectRatio: isMobile ? 2 : 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildProcessStep('1', 'Consultation', 'Understanding your requirements'),
              _buildProcessStep('2', 'Planning', 'Developing customized solutions'),
              _buildProcessStep('3', 'Deployment', 'Quick and efficient staff deployment'),
              _buildProcessStep('4', 'Support', 'Ongoing support and management'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProcessStep(String step, String title, String description) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary,
              child: Text(
                step,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
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
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}