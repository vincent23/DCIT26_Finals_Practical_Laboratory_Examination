
import 'dart:convert';

import 'package:material_ui/material_ui.dart';
import 'package:http/http.dart' as http;

import '../widgets/app_drawer.dart';
import 'profile_detail_screen.dart';
import 'home_screen.dart';
import 'about_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color green = Color(0xFF1E5E3A);
  static const Color lightGreen = Color(0xFFE8F2EC);

  Map<String, dynamic>? _user;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchRandomUser();
  }

  // Fetch Random User API
  Future<void> _fetchRandomUser() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http
          .get(
            Uri.parse('https://randomuser.me/api/'),
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final data =
            jsonDecode(response.body) as Map<String, dynamic>;

        final results = data['results'] as List<dynamic>?;

        if (results != null && results.isNotEmpty) {
          if (!mounted) return;

          setState(() {
            _user = results.first as Map<String, dynamic>;
            _isLoading = false;
          });
        } else {
          throw const FormatException(
            'No user data returned from API.',
          );
        }
      } else {
        throw Exception(
          'Server returned status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage =
            'Unable to load profile. Please check your internet connection.';
        _isLoading = false;
      });
    }
  }

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
          'Community Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      drawer: AppDrawer(
        onNavigate: (page) => _navigate(context, page),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    // Loading State
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: green,
            ),
            SizedBox(height: 16),
            Text(
              'Fetching random user...',
              style: TextStyle(
                color: green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    // Error State
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.redAccent,
              size: 60,
            ),

            const SizedBox(height: 15),

            Text(
              _errorMessage!,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _fetchRandomUser,
              icon: const Icon(Icons.refresh),
              label: const Text('RETRY'),
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    // Success State
    if (_user != null) {
      final name = _user!['name'] as Map<String, dynamic>?;

      final fullName =
          '${name?['title'] ?? ''} '
          '${name?['first'] ?? ''} '
          '${name?['last'] ?? ''}'.trim();

      final email = _user!['email'] ?? 'No email provided';

      final picture =
          _user!['picture'] as Map<String, dynamic>?;

      final imageUrl =
          picture?['large'] ?? picture?['medium'] ?? '';

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Profile Picture
          GestureDetector(
            onTap: _openProfileDetails,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: green,
                  width: 3,
                ),
              ),
              child: ClipOval(
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const Center(
                        child: CircularProgressIndicator(
                          color: green,
                        ),
                      );
                    },
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
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
          ),

          const SizedBox(height: 15),

          const Text(
            'Tap picture to view full profile',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            fullName.isNotEmpty ? fullName : 'Unknown User',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: green,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            email.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 30),

          // View Profile Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: _openProfileDetails,
              icon: const Icon(Icons.person),
              label: const Text('VIEW PROFILE'),
              style: OutlinedButton.styleFrom(
                foregroundColor: green,
                side: const BorderSide(color: green),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Refresh User Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _fetchRandomUser,
              icon: const Icon(Icons.refresh),
              label: const Text('NEW USER'),
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  void _openProfileDetails() {
    if (_user == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileDetailScreen(
          user: _user!,
        ),
      ),
    );
  }
}
