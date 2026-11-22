
import 'package:flutter/material.dart';

import '../models/resource.dart';
import '../widgets/app_drawer.dart';
import 'resource_detail_screen.dart';
import 'profile_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color green = Color(0xFF1E5E3A);
  static const Color lightGreen = Color(0xFFE8F2EC);

  //ginagamit para gumawa ng array list
  static const List<Resource> resources = [
    Resource(
      id: 'RES-001',
      title: 'University Library',
      description:
          'The university library provides books, '
          'research materials, study areas, and '
          'academic references for students.',
      rating: 4.8,
    ),
    Resource(
      id: 'RES-002',
      title: 'Computer Laboratory',
      description:
          'The computer laboratory provides '
          'computer facilities and internet access '
          'for programming and academic activities.',
      rating: 4.6,
    ),
    Resource(
      id: 'RES-003',
      title: 'Student Services',
      description:
          'Student Services assists students with '
          'enrollment, student records, and '
          'other university-related concerns.',
      rating: 4.7,
    ),
  ];

  //Navigate
  void navigate(BuildContext context, String page) {
    if (page == 'Profile') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    } else if (page == 'About') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AboutScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Companion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      drawer: AppDrawer(
        onNavigate: (page) => navigate(context, page),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            // Welcome Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Campus Companion!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your connected campus information hub.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Resources Heading
            const Text(
              'Campus Resources',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Explore available university facilities and services.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 15),

            // Resource List
            ...resources.map((resource) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResourceDetailScreen(
                          resource: resource,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 220, 243, 229),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.school,
                            color: green,
                            size: 28,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                resource.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF2C3E50),
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                resource.id,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Row(
                                children: [
                                  const SizedBox(width: 4),
                                  Text(
                                    resource.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Icon(
                          Icons.chevron_right,
                          color: green,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Community Profile Preview
            const Text(
              'Community Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),

            const SizedBox(height: 12),

            //Community Profile Card UI 
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 220, 243, 229),
                  child: Icon(
                    Icons.person,
                    color: green,
                  ),
                ),
                title: const Text(
                  'Random User Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'View generated community profile',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: green,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProfileScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
