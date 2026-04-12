import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'pages/home_page.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamdi Rebhi — Embedded Software Engineer',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}