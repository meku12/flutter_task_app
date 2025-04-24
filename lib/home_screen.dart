import 'package:flutter/material.dart';
import 'dart:collection';
import 'profile_screen.dart';
import 'calendar_screen.dart';
import 'detail_screen.dart';
import 'add_task_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager Lite',
      debugShowCheckedModeBanner: false, // 👈 This hides the debug banner
      home: TaskManagerHome(),
    );
  }
}

class TaskManagerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Stats/Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Task Stats/Overview",
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.assignment_turned_in_outlined,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text("5 tasks today"),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  // This is the horizontal line
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.access_alarm, color: Colors.red),
                    SizedBox(width: 10),
                    Text("3 tasks overdue"),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskFormScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('+ New Task', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            Text(
              "Task Filters",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                FilterChip(
                  label: Text("Date", style: TextStyle(color: Colors.black)),
                  onSelected: (val) {},
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    "Priority",
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (val) {},
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    "Completed",
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (val) {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Task List", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // 🔥 First Task - pressable
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => TaskDetailScreen(
                          // title: 'Complete Project Report',
                          // subtitle: 'Due by 08/15',
                          // priority: 'High',
                        ),
                  ),
                );
              },
              child: TaskTile(
                icon: Icons.push_pin,
                title: 'Complete Project Report',
                subtitle: 'Due by 08/15',
                priority: 'High',
                color: Colors.red,
              ),
            ),

            Divider(color: Colors.grey, thickness: 1),

            // 🔥 Second Task - pressable
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => TaskDetailScreen(
                          // title: 'Meeting with Team',
                          // subtitle: 'Due by 08/20',
                          // priority: 'Medium',
                        ),
                  ),
                );
              },
              child: TaskTile(
                icon: Icons.edit_calendar,
                title: 'Meeting with Team',
                subtitle: 'Due by 08/20',
                priority: 'Medium',
                color: Colors.grey,
              ),
            ),

            Divider(color: Colors.grey, thickness: 1),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalendarScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          // Do nothing for index 0 (Home) since you're already on it
        },
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String priority;
  final Color color;

  TaskTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.priority,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(
        priority,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 16, // Makes the priority text black
        ),
      ),
    );
  }
}
