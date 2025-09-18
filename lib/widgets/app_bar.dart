import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 2,
      title: Row(
        children: [
          Icon(
            Icons.security,
            color: AppColors.primary,
            size: 32,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'Globally Brilliant Security',
              style: TextStyle(
                color: AppColors.text,
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: isMobile ? null : [
        _buildNavButton(context, 'Home', '/'),
        _buildNavButton(context, 'About', '/about'),
        _buildNavButton(context, 'Services', '/services'),
        _buildNavButton(context, 'Careers', '/careers'),
        _buildNavButton(context, 'Contact', '/contact'),
        const SizedBox(width: 16),
      ],
      iconTheme: IconThemeData(color: AppColors.primary),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, String route) {
    final isActive = GoRouter.of(context).location == route;
    
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primary : AppColors.text,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}