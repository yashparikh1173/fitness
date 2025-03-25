import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  WorkoutsPage({super.key}); // Remove `const`
  final List<Map<String, dynamic>> workoutPlans = [
    {
      "title": "Beginner Plan",
      "exercises": ["Jumping Jacks", "Push-Ups", "Squats", "Plank"],
    },
    {
      "title": "Intermediate Plan",
      "exercises": ["Burpees", "Lunges", "Mountain Climbers", "Sit-Ups"],
    },
    {
      "title": "Advanced Plan",
      "exercises": ["Pull-Ups", "Deadlifts", "Box Jumps", "Handstand Push-Ups"],
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Workout Plans", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: workoutPlans.length,
          itemBuilder: (context, index) {
            return _buildWorkoutCard(context, workoutPlans[index]);
          },
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(BuildContext context, Map<String, dynamic> plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 6, spreadRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan["title"],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          ...plan["exercises"].map<Widget>((exercise) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text("• $exercise", style: const TextStyle(color: Colors.white, fontSize: 16)),
            );
          }).toList(),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Starting ${plan['title']}"), duration: Duration(seconds: 1)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Start Workout"),
            ),
          ),
        ],
      ),
    );
  }
}
