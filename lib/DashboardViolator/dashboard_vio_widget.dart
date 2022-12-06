import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/profile_picture_widget.dart';
import 'package:flutter_salam/Common/task_widget.dart';
import 'package:flutter_salam/DashboardViolator/dashboard_vio_logic.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:provider/provider.dart';

class DashboardViolatorWidget extends StatefulWidget {
  final DashboardViolatorLogic logic;
  const DashboardViolatorWidget({Key? key, required this.logic})
      : super(key: key);

  @override
  State<DashboardViolatorWidget> createState() =>
      _DashboardViolatorWidgetState();
}

class _DashboardViolatorWidgetState extends State<DashboardViolatorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppUserInfo user = context.read<AppProvider>().user;
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //logout and profile picture
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: logout,
            ),
            GestureDetector(
              child: ProfilePicture(picture: user.picture, id: user.userId),
              onTap: goToProfile,
            )
          ],
        ),
        //number of hours and fee

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                child: Column(
              children: [
                Text(
                  "قيمة المخالفات",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "${user.fee}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )),
            Flexible(
                child: Column(
              children: [
                Text(
                  "عدد الساعات",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "${user.getHours()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )),
          ],
        ),
        //available tasks
        Flexible(
            child: Row(children: [
          Text(
            "المهام النشطة",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ])),
        Expanded(
          child: ListView(
            children: [
              ...widget.logic.tasks
                  .map((task) => TaskWidget(model: task))
                  .toList()
            ],
          ),
        ),

        //completed tasks
        Flexible(
            child: Row(children: [
          Text(
            "المهام المكتملة",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ])),
        Expanded(
          child: ListView(
            children: [
              ...widget.logic
                  .loadCompletedTaskList()
                  .map((task) => TaskWidget(model: task))
                  .toList()
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: MyElevatedButton(
                  onPressed: goToTasksPage,
                  child: Text(
                    "صفحة المهام",
                  )),
            )
          ],
        )
      ],
    ));
  }

  void goToTasksPage() {
    Navigator.of(context).pushNamed('/allTasksPage');
  }

  void goToProfile() {
    Navigator.of(context).pushNamed('/profilePage');
  }

  void logout() {
    Navigator.of(context).pushReplacementNamed("/login");
  }
}
