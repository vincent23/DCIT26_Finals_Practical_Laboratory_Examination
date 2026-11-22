
import 'package:material_ui/material_ui.dart';

import '../widgets/app_drawer.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const Color green = Color(0xFF1E5E3A);
  static const Color lightGreen = Color(0xFFE8F2EC);

  void _navigate(BuildContext context, String page) {
    if (page == 'Home') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    } else if (page == 'Profile') {
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
          'About',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      drawer: AppDrawer(
        onNavigate: (page) => _navigate(context, page),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 25),

              Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  color: lightGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.school,
                  color: green,
                  size: 65,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Campus Companion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'CONNECTED CAMPUS HUB',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About the Application',
                      style: TextStyle(
                        color: green,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Campus Companion is a connected campus '
                      'application designed to help students '
                      'explore university resources and access '
                      'community profile information.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Application Features',
                      style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    SizedBox(height: 15),

                    _FeatureItem(
                      icon: Icons.navigation,
                      text: 'Screen Navigation',
                    ),

                    _FeatureItem(
                      icon: Icons.school,
                      text: 'Campus Resources',
                    ),

                    _FeatureItem(
                      icon: Icons.person,
                      text: 'Community Profile API',
                    ),

                    _FeatureItem(
                      icon: Icons.code,
                      text: 'Flutter Application',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Developed for DCIT 26',
                style: TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Cavite State University',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AboutScreen.green,
            size: 20,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
