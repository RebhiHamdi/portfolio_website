import '../models/experience.dart';

const List<Experience> experiences = [
  Experience(
    title: 'Embedded Software Engineer',
    company: 'Company Name',
    period: '2022 — Present',
    description:
        'Developing BLE-enabled embedded systems and sensor integration solutions for smart devices.',
    highlights: [
      'Architected firmware for nRF52-based BLE peripherals with OTA update support',
      'Implemented low-power sensor acquisition pipelines on STM32 with DMA and RTOS',
      'Reduced power consumption by 40% through optimized sleep mode transitions',
      'Collaborated with hardware team on PCB bring-up and signal integrity debugging',
    ],
  ),
  Experience(
    title: 'Flutter Developer',
    company: 'Cali Sport (Personal Project)',
    period: '2021 — 2022',
    description:
        'Designed and built the Cali Sport mobile application from concept to release.',
    highlights: [
      'Built a complete Flutter mobile app with clean architecture and responsive UI',
      'Integrated REST APIs and local data persistence with Hive',
      'Published to app stores with positive user feedback',
    ],
  ),
];