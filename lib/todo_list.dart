import 'package:flutter/material.dart';
import 'task.dart';
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
   List<Task> _tasks = [];
  TextEditingController _taskController = TextEditingController();
  String _currentFilter = 'All';

  void _addTask(String taskName) {
    setState(() {
      _tasks.add(Task(taskName, false));
      _taskController.clear();
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> filteredTasks = [];

    if (_currentFilter == 'All') {
      filteredTasks = List.from(_tasks);
    } else if (_currentFilter == 'Completed') {
      filteredTasks = _tasks.where((task) => task.isChecked).toList();
    } else if (_currentFilter == 'Uncompleted') {
      filteredTasks = _tasks.where((task) => !task.isChecked).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title:Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'To-Do List',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Filter: $_currentFilter',
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Task Filters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('All Tasks'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentFilter = 'All';
                });
              },
            ),
            ListTile(
              title: Text('Completed Tasks'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentFilter = 'Completed';
                });
              },
            ),
            ListTile(
              title: Text('Uncompleted Tasks'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentFilter = 'Uncompleted';
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: filteredTasks[index].isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        filteredTasks[index].isChecked = value ?? false;
                      });
                    },
                  ),
                  title: Text(filteredTasks[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeTask(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(labelText: 'Task'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      _addTask(_taskController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.blue,
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}