import 'package:flutter/material.dart';
import 'package:flutter_salam/AllTasks/all_tasks_logic.dart';
import 'package:flutter_salam/AllTasks/all_tasks_widget.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllTasksLogic logic = AllTasksLogic();
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
          title: Text("قائمة المهام"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: AllTasksWidget(logic: logic)));
  }
}
