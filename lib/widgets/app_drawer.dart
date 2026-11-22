
import 'package:material_ui/material_ui.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.onNavigate,
  });

  final ValueChanged<String> onNavigate;

  static const Color green = Color(0xFF1E5E3A);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 55,
              bottom: 25,
              left: 20,
            ),
            color: green,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: 12),
                Text(
                  'CAMPUS COMPANION',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'CONNECTED CAMPUS HUB',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          _drawerItem(
            context,
            Icons.home_outlined,
            'Home',
          ),

          _drawerItem(
            context,
            Icons.person_outline,
            'Profile',
          ),

          _drawerItem(
            context,
            Icons.info_outline,
            'About',
          ),

          const Spacer(),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Campus Companion v1.0',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return ListTile(
      leading: Icon(icon, color: green),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onNavigate(title);
      },
    );
  }
}
