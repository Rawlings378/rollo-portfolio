import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to My Portfolio',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Explore my projects and learn more about me.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          // Update the selected index to highlight the tapped item
          setState(() {
            _selectedIndex = index;
          });
          // Navigate to the corresponding page based on the index
          if (index == 1) {
            // Navigate to About Me page using named route
            Navigator.pushNamed(context, '/about Me');
          } else if (index == 2) {
            // Navigate to Projects page using named route
            Navigator.pushNamed(context, '/projects');
          }
          // For index 0 (Home), do nothing as we are already on the homepage
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About me'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
        ],
      ),
    );
  }
}
