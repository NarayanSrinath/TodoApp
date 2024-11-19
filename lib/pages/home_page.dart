import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box('myBox');

  @override
  void initState() {
    //if this app is open for  first time the create default data

    if (_mybox.get("TODOLIST") == null) {
      db.createIntialData();
    } else {
      // there is data alredy
      db.loadTaskData();
    }
    super.initState();
  }

  ToDoDatabase db = ToDoDatabase();

  TextEditingController taskController = TextEditingController();

  //on Change tapped
  void OnChangedTapped(bool? value, int index) {
    setState(() {
      db.todoTask[index][1] = !db.todoTask[index][1];
    });
    db.updateTaskData();
  }

  //save method

  void saveNewTask() {
    setState(() {
      db.todoTask.add([taskController.text, false]);
      taskController.clear();
    });
    Navigator.of(context).pop();
     db.updateTaskData();
  }

//add new task
  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DailogBox(
            controller: taskController,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        });
  }

  //deleteTask\
  void deleteTask(int index) {
    setState(() {
      db.todoTask.removeAt(index);
    });
     db.updateTaskData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade200,
        appBar: AppBar(
          centerTitle: true, // this is all you need
          backgroundColor: Colors.yellow,
          title: Text(
            'TO DO',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addNewTask();
            },
            backgroundColor: Colors.yellow,
            child: const Icon(Icons.add)),
        body: ListView.builder(
          itemCount: db.todoTask.length,
          itemBuilder: (context, index) {
            return TodoList(
              taskName: db.todoTask[index][0],
              taskValue: db.todoTask[index][1],
              onChange: (value) => OnChangedTapped(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
