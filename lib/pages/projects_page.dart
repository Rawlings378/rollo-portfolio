import 'package:flutter/material.dart';

// ignore: camel_case_types
class ProjectData {
  final String title;
  final String description;
  final IconData icon;
  final List<String> tags;
  ProjectData({
    required this.title,
    required this.description,
    required this.icon,
    required this.tags,
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProjectData> projects = [
      ProjectData(
        title: 'My portfolio website',
        description: 'This is my personal website to showcase my skills and all ive built in my entire development project carreer.',
        icon: Icons.person_2,
        tags: ['Flutter', 'Dart', 'Firebase'],
      ),
      ProjectData(
        title: 'JUiceFitApp',
        description: 'a mobile application that tracks and gives users food supplements that help them in daily nutrition',
        icon: Icons.fitness_center,
        tags: ['Flutter', 'Dart', 'Firebase'],
      ),
      ProjectData(
        title: 'A FintechApp',
        description: 'a Mobile money transfer application that allows securely transactions and manage finanaces on the go',
        icon: Icons.wallet,
        tags: ['Flutter', 'Dart', 'Firebase'],
      ),
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(125, 243, 140, 188),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ' My Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Checkout what ive built so far:',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 3 / 2.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(project: projects[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. A Custom Widget for the Project Card
// This makes the main code much cleaner to read
class _ProjectCard extends StatelessWidget {
  final ProjectData project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adds a subtle shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // Clip behavior ensures the Ripple effect stays inside the rounded corners
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          debugPrint("Clicked on ${project.title}");
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withValues(alpha :0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(project.icon, size: 32, color: Colors.indigo),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_outward, size: 20, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                project.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black54),
              ),
              const Spacer(),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: project.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}