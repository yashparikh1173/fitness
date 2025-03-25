import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          SizedBox(height: 20),
          _buildActivityGoals(),
          SizedBox(height: 20),
          _buildHealthMetrics(),
          SizedBox(height: 20),
          _buildWorkoutHistory(),
          SizedBox(height: 20),
          _buildAchievements(),
          SizedBox(height: 20),
          _buildSettings(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage("assets/profile.jpg"),
          onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 40, color: Colors.white),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("John Doe", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Edit Profile", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityGoals() {
    return _buildCard(
      title: "Activity Goals",
      child: Column(
        children: [
          _goalProgress("Move", 0.75, Colors.red),
          _goalProgress("Exercise", 0.6, Colors.green),
          _goalProgress("Stand", 0.9, Colors.blue),
        ],
      ),
    );
  }

  Widget _goalProgress(String title, double progress, Color color) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: Colors.grey.shade700,
                valueColor: AlwaysStoppedAnimation(color),
              ),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
            ],
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildHealthMetrics() {
    return _buildCard(
      title: "Health Metrics",
      child: Column(
        children: [
          _metricText("Heart Rate: 72 bpm"),
          _metricText("Sleep: 7h 30m"),
          _metricText("Water Intake: 2L"),
        ],
      ),
    );
  }

  Widget _metricText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }

  Widget _buildWorkoutHistory() {
    return _buildCard(
      title: "Workout History",
      child: Column(
        children: [
          _workoutItem("Running", "30 min", "250 kcal"),
          _workoutItem("Cycling", "45 min", "400 kcal"),
          TextButton(
            onPressed: () {},
            child: Text("View All Workouts", style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
    );
  }

  Widget _workoutItem(String type, String duration, String calories) {
    return ListTile(
      leading: Icon(Icons.fitness_center, color: Colors.white),
      title: Text(type, style: TextStyle(color: Colors.white)),
      subtitle: Text("$duration - $calories", style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildAchievements() {
    return _buildCard(
      title: "Achievements",
      child: Column(
        children: [
          _metricText("5-Day Streak!"),
          _metricText("100 Workouts Completed!"),
        ],
      ),
    );
  }

  Widget _buildSettings() {
    return _buildCard(
      title: "Settings",
      child: Column(
        children: [
          _settingItem("Units of Measurement", Icons.straighten),
          _settingItem("Notifications", Icons.notifications),
          _settingItem("Privacy Settings", Icons.lock),
        ],
      ),
    );
  }

  Widget _settingItem(String text, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {},
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade700, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
