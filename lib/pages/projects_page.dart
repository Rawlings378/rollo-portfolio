import 'package:flutter/material.dart';
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context)  {

    return Container (
      width:double.infinity,
      height:double.infinity,
      color:Color.fromARGB(125, 243, 140, 188),
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'My Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Here are some of the projects I have worked on using Flutter and other technologies.',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}