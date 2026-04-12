# Portfolio - Hamdi Rebhi

A modern, responsive portfolio website for Hamdi Rebhi - Embedded Software Engineer, built with Flutter. This project showcases professional experience, projects, skills, and videos in an elegant, interactive web interface.

## Features

- **Responsive Design**: Adapts seamlessly to mobile, tablet, and desktop screens
- **Hero Section**: Eye-catching introduction with call-to-action buttons
- **About Section**: Professional background and expertise overview
- **Experience Timeline**: Detailed work history and professional achievements
- **Projects Showcase**: Portfolio of completed projects with descriptions
- **Skills Section**: Display of technical competencies and proficiencies
- **Videos Section**: Embedded video demonstrations and tutorials
- **Contact Section**: Get in touch with integrated contact options
- **Modern UI**: Clean, professional design with smooth animations
- **Firebase Integration**: Backend support for dynamic content

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── app.dart                     # Main app configuration
├── pages/
│   └── home_page.dart          # Home page layout
├── widgets/
│   ├── components/             # Reusable UI components
│   │   ├── cta_button.dart
│   │   ├── experience_timeline.dart
│   │   ├── nav_bar.dart
│   │   ├── project_card.dart
│   │   ├── section_title.dart
│   │   ├── skill_chip.dart
│   │   └── video_card.dart
│   └── sections/               # Page sections
│       ├── about_section.dart
│       ├── contact_section.dart
│       ├── experience_section.dart
│       ├── footer_section.dart
│       ├── hero_section.dart
│       ├── projects_section.dart
│       ├── skills_section.dart
│       └── videos_section.dart
├── models/                     # Data models
│   ├── experience.dart
│   ├── project.dart
│   ├── skill.dart
│   └── video.dart
├── data/                       # Static data
│   ├── experience.dart
│   ├── projects.dart
│   ├── skills.dart
│   └── videos.dart
├── config/                     # Configuration files
│   ├── constants.dart
│   ├── responsive.dart
│   └── theme.dart
└── assets/                     # Images and resources
    └── images/
```

## Getting Started

### Prerequisites

- Flutter SDK (^3.10.4)
- Dart SDK
- A modern web browser (for web deployment)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/portfolio.git
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the project**
   ```bash
   flutter run -d chrome
   ```

### Development

To run the web version in development mode:
```bash
flutter run -d web --web-renderer html
```

Or for better performance:
```bash
flutter run -d web --web-renderer canvaskit
```

## Dependencies

- **flutter**: Core Flutter framework
- **google_fonts**: Custom Google Fonts integration
- **url_launcher**: Opens URLs and email links

## Building for Production

To build the web version for production:

```bash
flutter build web
```

The built files will be located in the `build/web` directory.

### Deploy to Firebase Hosting

1. Install Firebase CLI
2. Configure your Firebase project
3. Deploy with:
   ```bash
   firebase deploy
   ```

## Customization

### Update Content

Edit the data files in `lib/data/` to customize:
- Experience details (`experience.dart`)
- Projects information (`projects.dart`)
- Skills list (`skills.dart`)
- Video content (`videos.dart`)

### Modify Theme

Customize colors, typography, and styling in `lib/config/theme.dart`

### Adjust Responsive Breakpoints

Edit breakpoint values in `lib/config/responsive.dart` for different screen sizes

## Contributing

Feel free to fork this project and use it as a template for your own portfolio!

## License

This project is open source and available under the MIT License.

## Contact

- **Email**: [Your Email]
- **LinkedIn**: [Your LinkedIn URL]
- **GitHub**: [Your GitHub URL]

---

For more information about Flutter development, check the [official Flutter documentation](https://docs.flutter.dev/).
