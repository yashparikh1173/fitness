import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'workout_page.dart';
import 'social_page.dart'; // Import the Social Page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),  // Home content
    WorkoutsPage(), // Workouts content
    ProfilePage(), // Profile Page
    SocialPage(), // Social Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Fitness Tracker',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workouts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Social'),
        ],
      ),
    );
  }
}

// HomeScreen Content
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActivityRings(),
          SizedBox(height: 20),
          _buildDailySummary(),
          SizedBox(height: 20),
          _buildWorkoutHistory(),
          SizedBox(height: 20),
          _buildHealthMetrics(),
          SizedBox(height: 20),
          _buildMotivationTips(),
        ],
      ),
    );
  }

  Widget _buildMotivationTips() {
    return _buildCard(
      title: "Motivation Tips",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Stay consistent and keep pushing forward!", style: TextStyle(color: Colors.white)),
          Text("Small progress is still progress!", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildWorkoutHistory() {
    return _buildCard(
      title: "Workout History",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _summaryText("Monday: 30 min Cardio"),
          _summaryText("Tuesday: 40 min Strength Training"),
          _summaryText("Wednesday: Rest Day"),
          _summaryText("Thursday: 45 min Yoga"),
        ],
      ),
    );
  }

  Widget _buildActivityRings() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Activity Rings", style: _titleTextStyle()),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRing('Move', 0.75, Colors.red),
              _buildRing('Exercise', 0.6, Colors.green),
              _buildRing('Stand', 0.9, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRing(String title, double progress, Color color) {
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
      ],
    );
  }

  Widget _buildDailySummary() {
    return _buildCard(
      title: "Daily Summary",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _summaryText("Steps: 8,500"),
          _summaryText("Distance: 5.2 km"),
          _summaryText("Calories: 320 kcal"),
          _summaryText("Workout Time: 45 min"),
        ],
      ),
    );
  }

  Widget _summaryText(String text) {
    return Text(text, style: TextStyle(fontSize: 16, color: Colors.white));
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _titleTextStyle()),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildHealthMetrics() {
    return _buildCard(
      title: "Health Metrics",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMetricItem(Icons.favorite, "Heart Rate", "72 bpm"),
          _buildMetricItem(Icons.bedtime, "Sleep", "7h 30m"),
          _buildMetricItem(Icons.local_drink, "Water Intake", "2L"),
        ],
      ),
    );
  }

  Widget _buildMetricItem(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(value, style: TextStyle(color: Colors.grey)),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.blueGrey[800],
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 4, spreadRadius: 2),
      ],
    );
  }

  TextStyle _titleTextStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  }
}
