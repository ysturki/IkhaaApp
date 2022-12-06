import 'package:flutter/material.dart';
import 'package:flutter_salam/CreateTask/create_task_logic.dart';
import 'package:flutter_salam/CreateTask/create_task_widget.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateTaskLogic logic = CreateTaskLogic();
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text("انشاء مهمة جديدة"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: CreateTaskWidget(logic: logic)));
  }
}
