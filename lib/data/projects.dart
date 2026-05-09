import '../models/project.dart';

const List<Project> projects = [
  Project(
    id: 'cali-sport',
    title: 'Cali Sport & mono_motion',
    description:
        'End-to-end fitness tracking platforms. Designed responsive Flutter frontends connected to robust NestJS and MongoDB backends. Implemented custom mathematical algorithms for real-time mobile sensor exercise counting, with backend workflows automated via n8n',
    imageUrl: 'lib/assets/images/monomotion.jpeg',
    link: 'https://youtu.be/R-078cqLwqo?si=E2h3K5ZNZV-J-cMq',
    linkLabel: 'View on Youtube',
    tags: ['Flutter', 'Dart', 'Mobile', 'Firebase'],
  ),
  Project(
    id: 'ultrasonic-security',
    title: 'I2C Spatial Security System',
    description:
        'Engineered a spatial awareness security system utilizing an nRF52 microcontroller. Integrated a multiplexed array of 7 ultrasonic sensors over an I2C bus, optimizing sensor polling logic for precise, real-time environmental monitoring.',
    imageUrl: 'lib/assets/images/security_system.png',
    tags: ['C', 'nRF52', 'I2C', 'Multiplexing', 'Sensors'],
  ),
  Project(
    id: 'rinpen-smart-ring',
    title: 'rinPen: AI Digital Note Ring',
    description:
        'Architected a wearable smart ring for digital note-taking. Interfaced a PAN1780 (nRF52840) module with a 9-axis IMU (gyroscope, accelerometer, magnetometer) to stream motion data via BLE to a Flutter app, utilizing AI to translate hand gestures into digital text.',
    imageUrl: 'lib/assets/images/rinpen.png',
    tags: ['C', 'nRF52840', 'BLE', 'IMU', 'Flutter', 'AI'],
  ),
];