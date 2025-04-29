import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_manager.dart';
import 'profile_screen.dart';
import 'calendar_screen.dart';
import 'detail_screen.dart';
import 'add_task_screen.dart';
import 'notificationscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Theme(
      data: themeManager.currentTheme,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Task Stats/Overview',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 1,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0), // 👈 smaller right padding
              child: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Divider(color: Colors.grey, thickness: 1),
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
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('+ New Task'),
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
                  FilterChip(label: Text("Date"), onSelected: (val) {}),
                  SizedBox(width: 8),
                  FilterChip(label: Text("Priority"), onSelected: (val) {}),
                  SizedBox(width: 8),
                  FilterChip(label: Text("Completed"), onSelected: (val) {}),
                ],
              ),
              SizedBox(height: 20),
              Text("Task List", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              // First Task
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => TaskDetailScreen(
                            title: 'Complete Project Report',
                            description:
                                'Finish writing and submit project report for client review.',
                            time: '08/15',
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

              // Second Task
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => TaskDetailScreen(
                            title: 'Meeting with Team',
                            description:
                                'Weekly sync-up meeting with the product and design team.',
                            time: '08/20',
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
          },
        ),
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
          //color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
