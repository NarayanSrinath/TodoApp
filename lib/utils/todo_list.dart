import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TodoList extends StatelessWidget {

  final String taskName;
  final bool taskValue;
  Function(bool?) ? onChange;
   TodoList({super.key, required this.taskName, required this.taskValue, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25 ,top: 25),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow.shade300,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [

            //task value
            Checkbox(value: taskValue, onChanged: onChange, activeColor: Colors.black,),

            //Task name 
            Text(
              taskName,
              
              style: GoogleFonts.lato(
                fontSize: 15,
                fontStyle: FontStyle.normal,
            textStyle: TextStyle(decoration: taskValue ? TextDecoration.lineThrough : TextDecoration.none )),
              ),
          
          ],
        ),
      ),
    );
  }
}
