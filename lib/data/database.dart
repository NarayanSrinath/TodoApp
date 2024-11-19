import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List todoTask=[];
  //refernerce the hive  box
final _mybox= Hive.box('myBox');



//run this method  when app run for 1st time
void createIntialData(){

  todoTask=[

    ['Make Food', false],
    ['Get Water', false]
  ];
}

//load the data
void loadTaskData(){
  todoTask= _mybox.get('TODOLIST');
}

//update the database
void updateTaskData(){
  _mybox.put('TODOLIST',todoTask);
}

}