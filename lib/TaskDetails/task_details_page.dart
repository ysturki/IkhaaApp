import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/task_model.dart';
import 'package:flutter_salam/TaskDetails/task_details_logic.dart';
import 'package:flutter_salam/TaskDetails/task_details_widget.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, TaskModel> routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, TaskModel>;

    TaskDetailsLogic logic = TaskDetailsLogic(model: routes["task"]!);
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
          title: Text("معلومات المهمة"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TaskDetailsWidget(logic: logic)));
  }
}
