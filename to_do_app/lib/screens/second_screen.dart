import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/service/database_helper.dart';

class Task {
  int? id;
  String name;
  bool isCompleted;

  Task({this.id, required this.name, required this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<Task> _tasks = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final tasks = await _dbHelper.getTasks();
    setState(() {
      _tasks.clear();
      _tasks.addAll(tasks.map((task) => Task.fromMap(task)).toList());
    });
  }

  Future<void> _addTask(String taskName) async {
    final task = Task(name: taskName, isCompleted: false);
    await _dbHelper.insertTask(task.toMap());
    _fetchTasks();
  }

  Future<void> _editTask(int index, String newTaskName) async {
    final task = _tasks[index];
    task.name = newTaskName;
    await _dbHelper.updateTask(task.toMap());
    _fetchTasks();
  }

  Future<void> _deleteTask(int index) async {
    final task = _tasks[index];
    await _dbHelper.deleteTask(task.id!);
    _fetchTasks();
  }

  Future<void> _toggleTaskCompletion(int index) async {
    final task = _tasks[index];
    task.isCompleted = !task.isCompleted;
    await _dbHelper.updateTask(task.toMap());
    _fetchTasks();
  }

  void _showAddTaskDialog() {
    String newTask = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(hintText: 'Enter task here'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newTask.isNotEmpty) {
                  _addTask(newTask);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(int index) {
    String editedTask = _tasks[index].name;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            onChanged: (value) {
              editedTask = value;
            },
            controller: TextEditingController(text: _tasks[index].name),
            decoration: InputDecoration(hintText: 'Enter task here'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (editedTask.isNotEmpty) {
                  _editTask(index, editedTask);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Center(
            child: Text(
              "To-do List",
              style: TextStyle(color: whiteColor),
            )),
      ),
      body: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _tasks[index].name,
                style: TextStyle(
                    decoration: _tasks[index].isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              leading: Checkbox(
                value: _tasks[index].isCompleted,
                onChanged: (value) {
                  _toggleTaskCompletion(index);
                },
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: primaryColor),
                    onPressed: () {
                      _showEditTaskDialog(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteTask(index);
                    },
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
