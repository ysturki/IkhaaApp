import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/snackbar.dart';
import 'package:flutter_salam/Common/task_model.dart';
import 'package:flutter_salam/CreateTask/create_task_logic.dart';
import 'package:flutter_salam/Theme/theme.dart';

import 'package:intl/intl.dart';

class CreateTaskWidget extends StatefulWidget {
  final CreateTaskLogic logic;
  const CreateTaskWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  @override
  void initState() {
    // widget.logic.loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('yyyy-MM-dd');
    return SafeArea(
        child: Column(
      children: [
        Flexible(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: widget.logic.taskNameController,
                decoration: InputDecoration(
                  hintText: 'الاسم',
                  alignLabelWithHint: true,
                  labelText: 'الاسم',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: widget.logic.descController,
                decoration: InputDecoration(
                  hintText: 'الوصف',
                  alignLabelWithHint: true,
                  labelText: 'الوصف',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: widget.logic.hoursController,
                decoration: InputDecoration(
                  hintText: 'عدد الساعات',
                  alignLabelWithHint: false,
                  labelText: 'عدد الساعات',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: widget.logic.locationController,
                decoration: InputDecoration(
                  hintText: 'الموقع',
                  alignLabelWithHint: false,
                  labelText: 'الموقع',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: widget.logic.typeController,
                decoration: InputDecoration(
                  hintText: 'نوع المهمة',
                  alignLabelWithHint: false,
                  labelText: 'نوع المهمة',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                onTap: () async {
                  FocusNode().requestFocus();
                  DateTime? picked = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  AppColors.blue, // header background color
                              onPrimary: Colors.black, // header text color
                              onSurface: Colors.black, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: Colors.black, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)));
                  widget.logic.startController.text = picked.toString();
                },
                controller: widget.logic.startController,
                decoration: InputDecoration(
                  hintText: 'بداية المهمة',
                  alignLabelWithHint: false,
                  labelText: 'بداية المهمة',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                onTap: () async {
                  FocusNode().requestFocus();
                  DateTime? picked = await showDatePicker(
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  AppColors.blue, // header background color
                              onPrimary: Colors.black, // header text color
                              onSurface: Colors.black, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: Colors.black, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)));
                  widget.logic.timeRange = DateTimeRange(
                      start: widget.logic.timeRange.start,
                      end: picked ?? widget.logic.timeRange.end);
                  widget.logic.endController.text = picked.toString();
                },
                controller: widget.logic.endController,
                decoration: InputDecoration(
                  hintText: 'نهاية المهمة',
                  alignLabelWithHint: false,
                  labelText: 'نهاية المهمة',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: widget.logic.specializationController,
                decoration: InputDecoration(
                  hintText: 'التخصص',
                  alignLabelWithHint: false,
                  labelText: 'التخصص',
                ),
              ),
            ),
          ],
        ))),
        Row(
          children: [
            Expanded(
                child: MyElevatedButton(
                    onPressed: createTask, child: Text("اضافة مهمة جديدة")))
          ],
        )
      ],
    ));
  }

  createTask() async {
    //LOGIC to ADD Task

    TaskModel task = await widget.logic.createTask();
    showSnackbar(context, 'تم اضافة المهمة بنجاح');

    Navigator.pushReplacementNamed(
      context,
      '/taskDetailsPage',
      arguments: {'task': task},
    );
  }
}
