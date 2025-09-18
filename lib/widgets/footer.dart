import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.secondary,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          if (isMobile) _buildMobileFooter() else _buildDesktopFooter(),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          Text(
            '© 2024 Globally Brilliant Security 1 2 Z Services. All rights reserved.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildCompanyInfo(),
        ),
        Expanded(
          child: _buildQuickLinks(),
        ),
        Expanded(
          child: _buildServices(),
        ),
        Expanded(
          child: _buildContactInfo(),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      children: [
        _buildCompanyInfo(),
        const SizedBox(height: 30),
        _buildQuickLinks(),
        const SizedBox(height: 30),
        _buildServices(),
        const SizedBox(height: 30),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.security, color: AppColors.primary, size: 24),
            const SizedBox(width: 8),
            Text(
              'Globally Brilliant Security',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Providing comprehensive manpower, labour, and security solutions with excellence and reliability.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Home'),
        _buildFooterLink('About Us'),
        _buildFooterLink('Services'),
        _buildFooterLink('Careers'),
        _buildFooterLink('Contact'),
      ],
    );
  }

  Widget _buildServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Services',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Manpower Supply'),
        _buildFooterLink('Labour Contracting'),
        _buildFooterLink('Security Guards'),
        _buildFooterLink('Facility Management'),
        _buildFooterLink('Event Security'),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.phone, '+91 XXXXX XXXXX'),
        _buildContactItem(Icons.email, 'info@globallybrillientsecurity.com'),
        _buildContactItem(Icons.location_on, 'Your City, State, Country'),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}