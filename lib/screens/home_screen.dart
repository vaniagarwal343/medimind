import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data and reminders
    const String userName = "John"; // Replace with actual data
    final List<Map<String, String>> reminders = [
      {"icon": "warning", "message": "This medication might cause drowsiness."},
      {"icon": "fastfood", "message": "Remember to eat before taking this medication."},
      {"icon": "error", "message": "This med does not interact well with B12."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black), // Neutral header color
        ),
        backgroundColor: Colors.white, // Matches Figma design
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Greeting Header
            Text(
              "Hi, $userName! Let’s simplify your medication and health tracking.",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickActionButton(
                  context,
                  icon: Icons.add,
                  label: "Add Medication",
                  onPressed: () {
                    Navigator.pushNamed(context, '/add-medication');
                  },
                ),
                _buildQuickActionButton(
                  context,
                  icon: Icons.mood,
                  label: "Log Mood",
                  onPressed: () {
                    Navigator.pushNamed(context, '/log-mood');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Daily Insights & Reminders Section
            const Text(
              "Daily Insights & Reminders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Reminders List
            Column(
              children: reminders.map((reminder) {
                IconData icon;
                switch (reminder['icon']) {
                  case 'warning':
                    icon = Icons.warning;
                    break;
                  case 'fastfood':
                    icon = Icons.fastfood;
                    break;
                  case 'error':
                  default:
                    icon = Icons.error;
                    break;
                }
                return _buildReminderCard(icon: icon, message: reminder['message']!, color: Colors.red);
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Ask Me Anything Section
            const Text(
              "Ask Me Anything",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                hintText: "Ask me about your next dose or drug interactions...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.chat_bubble_outline),
              ),
              onSubmitted: (query) {
                // Implement search or chatbot logic here
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/profile');
            break;
          case 2:
            Navigator.pushNamed(context, '/chatbot'); // Link to ChatbotScreen
            break;
          case 3:
            Navigator.pushNamed(context, '/tracker');
            break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Quick Q/A', // This links to ChatbotScreen
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Tracker',
          ),
        ],
      selectedItemColor: const Color(0xFF007AFF),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildQuickActionButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF007AFF),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildReminderCard(
      {required IconData icon, required String message, required Color color}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          message,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

