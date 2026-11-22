
import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({
    super.key,
    required this.user,
  });

  final Map<String, dynamic> user;

  static const Color green = Color(0xFF1E5E3A);
  static const Color lightGreen = Color(0xFFE8F2EC);

  @override
  Widget build(BuildContext context) {
    final name = user['name'] as Map<String, dynamic>?;

    final fullName =
        '${name?['first'] ?? ''} ${name?['last'] ?? ''}'.trim();

    final picture =
    user['picture'] as Map<String, dynamic>?;

    final imageUrl =
        picture?['large']?.toString() ??
        picture?['medium']?.toString() ??
        '';

    debugPrint('PROFILE IMAGE URL: $imageUrl');

    final email = user['email'] ?? 'N/A';
    final phone = user['phone'] ?? 'N/A';
    final cell = user['cell'] ?? 'N/A';

    final gender = user['gender'] ?? 'N/A';

    final login = user['login'] as Map<String, dynamic>?;

    final username = login?['username'] ?? 'N/A';
    final uuid = login?['uuid'] ?? 'N/A';

    final location =
        user['location'] as Map<String, dynamic>?;

    final city = location?['city'] ?? 'N/A';
    final country = location?['country'] ?? 'N/A';

    final nat = user['nat'] ?? 'N/A';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              // Profile Image
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: green,
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: SizedBox(
                    width: 115,
                    height: 115,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,

                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return const Center(
                          child: CircularProgressIndicator(
                            color: green,
                          ),
                        );
                      },

                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('PROFILE IMAGE ERROR: $error');

                        return Container(
                          color: lightGreen,
                          child: const Icon(
                            Icons.person,
                            size: 65,
                            color: green,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                fullName.isNotEmpty
                    ? fullName
                    : 'Unknown User',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Generated Community Profile',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 25),

              _detailTile(
                Icons.person_outline,
                'Gender',
                gender.toString(),
              ),

              _detailTile(
                Icons.account_circle_outlined,
                'Username',
                username.toString(),
              ),

              _detailTile(
                Icons.fingerprint,
                'UUID',
                uuid.toString(),
              ),

              _detailTile(
                Icons.email_outlined,
                'Email',
                email.toString(),
              ),

              _detailTile(
                Icons.phone_outlined,
                'Phone',
                phone.toString(),
              ),

              _detailTile(
                Icons.phone_android,
                'Cell',
                cell.toString(),
              ),

              _detailTile(
                Icons.location_city,
                'City',
                city.toString(),
              ),

              _detailTile(
                Icons.flag_outlined,
                'Country',
                country.toString(),
              ),

              _detailTile(
                Icons.public,
                'Nationality',
                nat.toString(),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailTile(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: green,
            size: 21,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF2C3E50),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
