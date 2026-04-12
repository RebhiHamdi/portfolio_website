import '../models/project.dart';

const List<Project> projects = [
  Project(
    id: 'cali-sport',
    title: 'Cali Sport',
    description:
        'A Flutter mobile application for sports enthusiasts. Features real-time activity tracking, '
        'social sharing, and a clean intuitive interface built for performance.',
    imageUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
    link: 'https://github.com/hamdirebhi',
    linkLabel: 'View on GitHub',
    tags: ['Flutter', 'Dart', 'Mobile', 'Firebase'],
  ),
  Project(
    id: 'ble-firmware',
    title: 'BLE Device Firmware',
    description:
        'Custom firmware for nRF52-based BLE peripherals. Implements power-efficient connection '
        'management, OTA updates, and sensor data streaming over BLE GATT services.',
    imageUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
    tags: ['C', 'nRF52', 'BLE', 'Embedded', 'RTOS'],
  ),
  Project(
    id: 'stm32-sensor-hub',
    title: 'STM32 Sensor Hub',
    description:
        'Multi-sensor acquisition system on STM32. Reads IMU, environmental, and proximity sensors '
        'with DMA-based I2C/SPI, processes data through a filter pipeline, and transmits over UART/USB.',
    imageUrl: 'https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
    tags: ['C/C++', 'STM32', 'I2C', 'SPI', 'DMA', 'Sensors'],
  ),
];