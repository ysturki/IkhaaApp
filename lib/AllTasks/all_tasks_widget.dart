import 'package:flutter/material.dart';
import 'package:flutter_salam/AllTasks/all_tasks_logic.dart';
import 'package:flutter_salam/Common/task_widget.dart';

class AllTasksWidget extends StatefulWidget {
  final AllTasksLogic logic;
  const AllTasksWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<AllTasksWidget> createState() => _AllTasksWidgetState();
}

class _AllTasksWidgetState extends State<AllTasksWidget> {
  @override
  void initState() {
    // widget.logic.loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            alignLabelWithHint: true,
            hintText: "ابحث عن المهام",
            labelText: "ابحث عن المهام",
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ...widget.logic.tasks
                  .map((task) => TaskWidget(model: task))
                  .toList()
            ],
          ),
        ),
      ],
    ));
  }
}
