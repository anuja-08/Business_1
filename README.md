# Globally Brilliant Security 1 2 Z Services - Website

A professional Flutter web application for Globally Brilliant Security 1 2 Z Services, providing comprehensive manpower, labour, and security solutions.

## Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Professional UI**: Clean, modern design with blue color scheme
- **Complete Navigation**: Home, About, Services, Careers, and Contact pages
- **Contact Forms**: Lead capture and job application forms with validation
- **File Upload**: Resume upload functionality for job applications
- **SEO Ready**: Proper meta tags and descriptions for search engines

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Web browser (Chrome recommended for development)

### Installation

1. **Clone or download this project**

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the development server:**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production:**
   ```bash
   flutter build web
   ```

## Project Structure

```
lib/
├── main.dart                 # Main application entry point
├── utils/
│   └── app_colors.dart      # Color constants and theme
├── widgets/
│   ├── app_bar.dart         # Custom navigation bar
│   └── footer.dart          # Website footer
└── screens/
    ├── home_screen.dart     # Homepage with hero section and overview
    ├── about_screen.dart    # Company information and team
    ├── services_screen.dart # Detailed service descriptions
    ├── careers_screen.dart  # Job listings and application form
    └── contact_screen.dart  # Contact information and inquiry form

web/
├── index.html              # Main HTML template
└── manifest.json           # PWA configuration

assets/
├── images/                 # Company images and photos
└── icons/                  # Icons and favicons
```

## Customization

### 1. Update Company Information
- Replace placeholder text in all screen files
- Add real contact details (phone, email, address)
- Update company description and history

### 2. Add Visual Assets
- Add company logo to `assets/images/`
- Add team photos and service images
- Update favicon in `web/` directory

### 3. Configure Contact Details
- Update phone numbers in `contact_screen.dart`
- Set real email addresses
- Configure Google Maps with actual location

### 4. Customize Colors and Branding
- Modify colors in `lib/utils/app_colors.dart`
- Update fonts in `main.dart`
- Adjust styling throughout the application

## Deployment

### Firebase Hosting
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize: `firebase init hosting`
3. Build: `flutter build web`
4. Deploy: `firebase deploy`

### Other Hosting Options
- **Netlify**: Drag and drop the `build/web` folder
- **Vercel**: Connect your repository for automatic deployments
- **GitHub Pages**: Use the `build/web` folder as source

## Development

### Adding New Pages
1. Create new screen file in `lib/screens/`
2. Add route in `main.dart`
3. Update navigation in `app_bar.dart`

### Form Handling
- Forms use `flutter_form_builder` for validation
- File uploads use `file_picker` package
- Add backend integration for form submissions

### SEO Optimization
- Update meta tags in `web/index.html`
- Add structured data for better search visibility
- Optimize images and loading performance

## Support

For technical support or customization requests, please contact your development team.

## License

© 2024 Globally Brilliant Security 1 2 Z Services. All rights reserved.