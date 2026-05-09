import '../models/experience.dart';

const List<Experience> experiences = [
  Experience(
    title: 'Lead Embedded Software Engineer',
    company: 'Gewinner',
    period: 'Oct 2025 — Present',
    description:
        'Leading the firmware architecture for a BLE-enabled smart ring.',
    highlights: [
      'Developed low-power nRF52 firmware integrating accelerometer and gyroscope sensors for gesture-based interactions',
      'Defined and validated BLE GATT services, characteristics, and custom data formats for seamless mobile app synchronization',
      'Mentored engineering students on complex STM32F7 vision systems utilizing OV7670 camera modules',
      'Collaborated with hardware team on PCB bring-up and signal integrity debugging',
    ],
  ),
  Experience(
    title: 'Embedded Software Developer',
    company: 'STMicroelectronics',
    period: 'Oct 2024 — Oct 2025',
    description:
        'Engineered critical firmware update tools and GUI components for the STM32 ecosystem.',
    highlights: [
      'Architected a firmware comparison functionality in STM32CubeProgrammer utilizing robust checksum-based validation',
      'Drastically reduced reprogramming time by enabling selective flash sector updates',
      'Published to app stores with positive user feedbackDeveloped and debugged JavaFX-based GUI components, improving overall tool stability',
    ],
  ),
];