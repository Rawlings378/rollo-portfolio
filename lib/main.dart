import 'package:flutter/material.dart';
import 'package:rollo_portfolio/pages/about_me.dart';
import 'package:rollo_portfolio/pages/projects_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects':(context) => const ProjectsPage()
      },
    );
  }
}