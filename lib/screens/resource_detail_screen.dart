
import 'package:flutter/material.dart';
import '../models/resource.dart';

class ResourceDetailScreen extends StatelessWidget {
  const ResourceDetailScreen({
    super.key,
    required this.resource,
  });

  final Resource resource;

  static const Color green = Color(0xFF1E5E3A);
  static const Color lightGreen = Color(0xFFE8F2EC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resource Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    border: Border.all(color: green),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Text(
                  resource.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Resource Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: green,
                ),
              ),

              const SizedBox(height: 15),

              _detailTile(
                'Resource ID',
                resource.id,
              ),

              _detailTile(
                'Resource Name',
                resource.title,
              ),

              _detailTile(
                'Description',
                resource.description,
              ),

              _detailTile(
                'Rating',
                '${resource.rating} / 5',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to Resources'),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailTile(
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: green,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF2C3E50),
                    fontSize: 14,
                    height: 1.4,
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
