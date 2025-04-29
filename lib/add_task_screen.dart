import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_manager.dart';
import 'home_screen.dart';

void main() => runApp(TaskFormScreen());

class TaskFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskForm(), debugShowCheckedModeBanner: false);
  }
}

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  String _priority = '';

  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final theme = themeManager.currentTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ); // This goes back to the previous screen
            },
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task Title"),
              SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Enter task title",
                  border: OutlineInputBorder(), // Makes it a rectangular box
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
              ),

              SizedBox(height: 12),
              Text("Task Description"),
              SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter task description",
                  border: OutlineInputBorder(), // Rectangular box
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
              ),

              SizedBox(height: 12),
              Text("Due Date"),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          _selectedDate == null
                              ? "Pick a due date"
                              : _selectedDate.toString().split(' ')[0],
                      border: OutlineInputBorder(), // Rectangular box
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),
              Text("Priority"),
              Row(
                children:
                    ['High', 'Medium', 'Low'].map((level) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Text(level),
                          selected: _priority == level,
                          onSelected: (_) {
                            setState(() {
                              _priority = level;
                            });
                          },
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48, // Increased height
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          // Cancel logic
                        },
                        child: Text(
                          "Cancel",
                          //style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 48, // Increased height
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          // Save logic
                        },
                        child: Text(
                          "Save",
                          //style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
