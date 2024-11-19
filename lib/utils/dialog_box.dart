import 'package:flutter/material.dart';
import 'package:todoapp/utils/buttons.dart';

class DailogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DailogBox({super.key, required this.controller, required this.onCancel ,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: Container(
        height: 120,
       // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration:
               InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Add a new task"),
            ),

            const SizedBox(
              height: 10,
            ),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(buttonText: "Save", onPressed: onSave),
                  const SizedBox(
              width: 10,
            ),
                Buttons(buttonText: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
