import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Title Here',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.red),
              title: Text(
                'Due Date',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('MM/DD/YYYY'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text(
                'Priority',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('High'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.description, color: Colors.grey),
              title: Text(
                'Description',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Detailed description of the task here. Include any additional notes or instructions relevant to completing the task.',
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.radio_button_checked, color: Colors.blue),
              title: Text(
                'Status',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Pending'),
            ),
            Divider(color: Colors.grey, thickness: 1),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Mark as Completed',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold, // 👈 this makes it bold
                ),
              ),

              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Delete Task',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold, // 👈 this makes it bold
                ),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
