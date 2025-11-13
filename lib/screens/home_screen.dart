import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../models/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample tasks for now - we'll replace with database later
  List<TaskItem> tasks = [
    TaskItem(
      id: 1,
      title: 'Complete Flutter Assignment',
      priority: 'High',
      description: 'Finish Task Notes Manager app',
    ),
    TaskItem(
      id: 2,
      title: 'Study for Exams',
      priority: 'Medium',
      description: 'Prepare for upcoming tests',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks & Notes'),
      ),
      body: Column(
        children: [
          // Welcome message
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'My Tasks & Notes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Tasks list
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text('Priority: ${task.priority}'),
                    trailing: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        setState(() {
                          task.isCompleted = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}