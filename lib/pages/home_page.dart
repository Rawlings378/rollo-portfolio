// lib/pages/home_page.dart

import 'package:flutter/material.dart';
// Import the animation package
import 'package:flutter_animate/flutter_animate.dart';
// Import the other pages we need to show
import 'package:rollo_portfolio/pages/about_me.dart';
import 'package:rollo_portfolio/pages/projects_page.dart';

// HomePage is now our main "shell" widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// The State class holds all the logic and the selected tab index
class _HomePageState extends State<HomePage> {
  // A variable to store the index of the currently selected tab
  // 0 = Home, 1 = About, 2 = Projects
  int _selectedIndex = 0;

  // This list will hold the actual page widgets we want to show
  // We use 'late final' because we initialize it in 'initState'
  late final List<Widget> _pages;

  // This function is called once when the widget is first created
  @override
  void initState() {
    super.initState();
    
    // Now we define our list of pages
    _pages = <Widget>[
      // Index 0: The content built by our *local helper method* below
      _buildHomePageContent(),
      
      // Index 1: The existing AboutPage
      const AboutPage(),
      
      // Index 2: The existing ProjectsPage
      const ProjectsPage(),
    ];
  }

  // This function is called whenever a tab in the BottomNavigationBar is tapped
  void _onItemTapped(int index) {
    // setState tells Flutter to rebuild the widget with the new state
    setState(() {
      // Update our variable to match the new tab index
      _selectedIndex = index;
    });
  }

  // The build method is called every time setState is called
  @override
  Widget build(BuildContext context) {
    // A list of the titles for the AppBar
    const List<String> pageTitles = [
      'Home', // Title for index 0
      'About Me', // Title for index 1
      'My Projects', // Title for index 2
    ];

    // Scaffold is the main layout structure for our app
    return Scaffold(
      appBar: AppBar(
        // The title is dynamically set from our list
        title: Text(pageTitles[_selectedIndex]),
        // Make the AppBar's background transparent
        backgroundColor: Colors.transparent,
        // Remove the shadow/elevation
        elevation: 0,
      ),
      // This tells the body to draw *behind* the AppBar
      extendBodyBehindAppBar: true,

      // The main content of the page
      // IndexedStack keeps all pages in memory and preserves their state
      // (like scroll position) when you switch tabs.
      body: IndexedStack(
        index: _selectedIndex, // Show the page matching the selected index
        children: _pages, // The list of all pages
      ),

      // The navigation bar at the bottom
      bottomNavigationBar: BottomNavigationBar(
        // Tells the bar which item is currently active
        currentIndex: _selectedIndex,
        // The function to call when a new item is tapped
        onTap: _onItemTapped,
        // The list of items (tabs)
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

  //
  // --- This is the key! ---
  // This is the *content* for the home page (index 0)
  // By making it a helper method, we keep it in the *same file*
  // but separate from the main build logic.
  //
  Widget _buildHomePageContent() {
    // A Container allows us to add background styling, like a gradient
    return Container(
      // The decoration property is for styling
      decoration: BoxDecoration(
        // We'll use a LinearGradient for a modern background
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
            Theme.of(context).colorScheme.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      // Center all the content
      child: Center(
        // ConstrainedBox limits the width on desktops
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            // Column arranges its children vertically
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- 1. Interactive Avatar ---
                CircleAvatar(
                  radius: 80,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  //  Add your photo here!
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .scale(delay: 200.ms),

                const SizedBox(height: 32),

                // --- 2. Animated Title ---
                Text(
                  "Hi, I'm RAwlings Adera", //  Change this
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

                // --- 3. Animated Subtitle ---
                Text(
                  " Dart with Flutter Developer", 
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                )
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 600.ms)
                    .slide(begin: const Offset(0, 0.5), delay: 600.ms),

                const SizedBox(height: 48),

                // --- 4. Interactive Call-to-Action Button ---
                ElevatedButton(
                  // When pressed, call our local function to switch tabs
                  onPressed: () => _onItemTapped(2), // Go to Projects (index 2)
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