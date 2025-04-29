import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_manager.dart';

class TaskDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  const TaskDetailScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final theme = themeManager.currentTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.teal),
                title: Text(
                  'Time',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(time, style: theme.textTheme.bodyMedium),
              ),
              Divider(color: theme.dividerColor),
              ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.red),
                title: Text(
                  'Due Date',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('01/15/2025', style: theme.textTheme.bodyMedium),
              ),
              Divider(color: theme.dividerColor),
              ListTile(
                leading: Icon(Icons.warning, color: Colors.orange),
                title: Text(
                  'Priority',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('High', style: theme.textTheme.bodyMedium),
              ),
              Divider(color: theme.dividerColor),
              ListTile(
                leading: Icon(Icons.description, color: theme.iconTheme.color),
                title: Text(
                  'Description',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(description, style: theme.textTheme.bodyMedium),
              ),
              Divider(color: theme.dividerColor),
              ListTile(
                leading: Icon(Icons.radio_button_checked, color: Colors.blue),
                title: Text(
                  'Status',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Pending', style: theme.textTheme.bodyMedium),
              ),
              Divider(color: theme.dividerColor, thickness: 1),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                  foregroundColor:
                      theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Edit Task'),
              ),
              SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.textTheme.bodyLarge?.color,
                  side: BorderSide(color: theme.dividerColor),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Mark as Completed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.textTheme.bodyLarge?.color,
                  side: BorderSide(color: theme.dividerColor),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Delete Task',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
