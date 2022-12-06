import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/snackbar.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:flutter_salam/TaskDetails/task_details_logic.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskDetailsWidget extends StatefulWidget {
  final TaskDetailsLogic logic;
  const TaskDetailsWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<TaskDetailsWidget> createState() => _TaskDetailsWidgetState();
}

class _TaskDetailsWidgetState extends State<TaskDetailsWidget> {
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
                controller:
                    TextEditingController(text: widget.logic.model.name),
                enabled: false,
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
                controller:
                    TextEditingController(text: (widget.logic.model.desc)),
                enabled: false,
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
                controller:
                    TextEditingController(text: (widget.logic.model.hours)),
                enabled: false,
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
                controller:
                    TextEditingController(text: widget.logic.model.location),
                enabled: false,
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
                controller:
                    TextEditingController(text: widget.logic.model.type),
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'نوع المهمة',
                  alignLabelWithHint: false,
                  label: Text('نوع المهمة'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: TextEditingController(
                    text: formatter.format(widget.logic.model.startTime)),
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'بداية المهمة',
                  alignLabelWithHint: false,
                  label: Text(
                    'بداية المهمة',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: TextEditingController(
                    text: formatter.format(widget.logic.model.endTime)),
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'نهاية المهمة',
                  alignLabelWithHint: false,
                  label: Text(
                    'نهاية المهمة',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: TextEditingController(
                    text: widget.logic.model.specialization),
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'التخصص',
                  alignLabelWithHint: false,
                  label: Text('التخصص'),
                ),
              ),
            ),
            widget.logic.model.acceptedById == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: TextEditingController(
                          text: widget.logic.model.acceptedById != null
                              ? "ياسر تركستاني"
                              : "لا احد"),
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'قبلت من',
                        alignLabelWithHint: false,
                        label: Text(
                          'قبلت من',
                        ),
                      ),
                    ),
                  ),
          ],
        ))),
        Row(
          children: [
            Expanded(
                child: MyElevatedButton(
              onPressed: acceptTask,
              child: Text(getButtonText()),
            ))
          ],
        )
      ],
    ));
  }

  String getButtonText() {
    bool isViolator = context.read<AppProvider>().user.isViolator;
    int st = widget.logic.model.status;
    String text = "";
    if (isViolator) {
      if (st == 0) {
        text = "المهمة مكتملة";
      } else if (st == 1) {
        text = "اقبل المهمة";
      } else if (st == 2) {
        text = "المهمة نشطة";
      } else if (st == 3) {
        text = "الطلب قيد الانتظار";
      } else {
        text = "اقبل المهمة";
      }
    } else {
      if (st == 0) {
        text = "المهمة مكتملة";
      } else if (st == 1) {
        text = "المهمة متاحة";
      } else if (st == 2) {
        text = "المهمة نشطة";
      } else if (st == 3) {
        text = "اقبل العرض";
      } else {
        text = "اقبل العرض";
      }
    }
    return text;
  }

  void acceptTask() {
    bool isViolator = context.read<AppProvider>().user.isViolator;
    int st = widget.logic.model.status;
    //LOGIC to ADD Task
    if (isViolator) {
      if (st == 0) {
        return;
      } else if (st == 1) {
        showSnackbar(context, "تم قبول المهمة بنجاح");
        Navigator.of(context).pushReplacementNamed('/dashboardViolator');
        return;
      } else if (st == 2) {
        return;
      } else if (st == 3) {
        return;
      } else {
        return;
      }
    } else {
      if (st == 0) {
        return;
      } else if (st == 1) {
        return;
      } else if (st == 2) {
        return;
      } else if (st == 3) {
        showSnackbar(context, "تم قبول العرض بنجاح");
        Navigator.of(context).pushReplacementNamed('/dashboardBeneficiary');
        return;
      } else {
        return;
      }
    }
  }
}
