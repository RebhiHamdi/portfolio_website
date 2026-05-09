class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String link;
  final String date;

  const Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.link,
    required this.date,
  });
}

const List<Article> articles = [
  Article(
    title: 'Building an MPU6050 motion tracking system on the nRF52',
    description: 'A deep dive into my implementation. Exploring the hardware integration and firmware logic required to process IMU data on Nordic microcontrollers.',
    imageUrl: 'lib/assets/images/mpu.png', // Add your thumbnail to assets!
    link: 'https://medium.com/@hamdi22rebhk/building-an-mpu6050-motion-tracking-system-on-the-nrf52-a-deep-dive-into-my-implementation-8ba181805565', // Replace with the direct article URL
    date: 'Dec 8, 2025',
  ),
  Article(
    title: 'Building a Secure Authentication Backend with NestJS & MongoDB',
    description: 'A complete guide to designing secure, scalable backend authentication architectures using JSON Web Tokens (JWT).',
    imageUrl: 'lib/assets/images/backend_nestjs.png', 
    link: 'https://medium.com/@hamdi22rebhk/building-a-secure-authentication-backend-with-nestjs-mongodb-and-jwt-a-complete-guide-b549b68dd6b8', 
    date: 'Dec 19, 2025',
  ),
  Article(
    title: 'Lessons Learned from Supervising an Intern in Embedded Systems',
    description: 'Reflections on engineering leadership, mentoring, and translating academic theory into production-ready firmware skills.',
    imageUrl: 'lib/assets/images/supervisor.png', 
    link: 'https://medium.com/@hamdi22rebhk/lessons-learned-from-supervising-an-intern-in-embedded-systems-a31de5d17992', 
    date: 'Sep 28, 2025',
  ),
];