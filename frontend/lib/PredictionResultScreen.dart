import 'package:flutter/material.dart';
import 'dart:convert'; // To parse the JSON response

class PredictionResultScreen extends StatelessWidget {
  final String responseData;

  const PredictionResultScreen({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    // Parse the JSON response
    final Map<String, dynamic> data = json.decode(responseData);
    final String age = data['age'];
    final String gender = data['gender'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Prediction Results',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              _buildResultCard('Gender', gender, Icons.person),
              const SizedBox(height: 20),
              _buildResultCard('Age', age, Icons.cake),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a styled card for each result
  Widget _buildResultCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blueAccent,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
