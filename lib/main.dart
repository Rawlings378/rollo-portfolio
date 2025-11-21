// lib/main.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rollo_portfolio/pages/home_page.dart';
 import 'package:rollo_portfolio/pages/about_me.dart';
import 'package:rollo_portfolio/pages/projects_page.dart';

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
      
      // Your theme code is perfect
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,

      // This is the only change
      // We removed the 'routes' and just set 'home' to HomePage
      routes:{
        '/': (context) => const HomePage(),
        'projects': (context) => const ProjectsPage(),
        'about me': (context) => const AboutPage(),


      }
    );
  }
}
     
  
    
