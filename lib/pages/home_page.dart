// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rollo_portfolio/pages/about_me.dart';
import 'package:rollo_portfolio/pages/projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // We only keep the index state here
  int _selectedIndex = 0;

  // We REMOVED the 'late final List<Widget> _pages' and 'initState'
  // logic from here to fix the crash.

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // --- 1. Define the pages HERE inside build ---
    // This fixes the error because 'context' is now fully ready
    final List<Widget> pages = [
      _buildHomePageContent(), // Index 0
      const AboutPage(),       // Index 1
      const ProjectsPage(),    // Index 2
    ];

    const List<String> pageTitles = [
      'Home',
      'About Me',
      'My Projects',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[_selectedIndex]),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      
      // --- 2. Use the local 'pages' list ---
      body: IndexedStack(
        index: _selectedIndex,
        children: pages, 
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
        ],
      ),
    );
  }

  // Helper method to build the Home content
  Widget _buildHomePageContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // This line caused the crash before, but now it is safe!
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            Theme.of(context).colorScheme.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .scale(delay: 200.ms),

                const SizedBox(height: 32),

                Text(
                  "Hi, I'm Rawlings Adera", 
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .slide(begin: const Offset(0, 0.5), delay: 400.ms),

                const SizedBox(height: 16),

                Text(
                  "Flutter Developer",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 600.ms)
                    .slide(begin: const Offset(0, 0.5), delay: 600.ms),

                const SizedBox(height: 48),

                ElevatedButton(
                  onPressed: () => _onItemTapped(2), 
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 20),
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                  child: const Text("View My Work"),
                )
                    .animate()
                    .fadeIn(delay: 800.ms, duration: 600.ms)
                    .slide(begin: const Offset(0, 0.5), delay: 800.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}