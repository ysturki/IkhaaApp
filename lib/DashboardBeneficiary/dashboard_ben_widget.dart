import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/profile_picture_widget.dart';
import 'package:flutter_salam/Common/task_widget.dart';
import 'package:flutter_salam/DashboardBeneficiary/dashboard_ben_logic.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:provider/provider.dart';

class DashboardBeneficiaryWidget extends StatefulWidget {
  final DashboardBenificiaryLogic logic;
  const DashboardBeneficiaryWidget({Key? key, required this.logic})
      : super(key: key);

  @override
  State<DashboardBeneficiaryWidget> createState() =>
      _DashboardBeneficiaryWidgetState();
}

class _DashboardBeneficiaryWidgetState
    extends State<DashboardBeneficiaryWidget> {
  @override
  void initState() {
    // widget.logic.loadUserInfo();
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
              child: ProfilePicture(
                picture: user.picture,
                id: user.userId,
              ),
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
                  "عدد المساهمين",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "٧٠",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )),
            Flexible(
                child: Column(
              children: [
                Text(
                  "المستحقات",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "١٨٠٠",
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
            "المهمات الحالية",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ])),
        Expanded(
          child: ListView(
            children: [
              ...widget.logic.activeTasks
                  .map((task) => TaskWidget(model: task))
                  .toList()
            ],
          ),
        ),
        //available tasks
        Flexible(
            child: Row(children: [
          Text(
            "المهمات المكتملة",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ])),
        Expanded(
          child: ListView(
            children: [
              ...widget.logic
                  .getCompletedTasks()
                  .map((task) => TaskWidget(model: task))
                  .toList()
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: MyElevatedButton(
                  onPressed: createTask,
                  child: Text(
                    " انشاء مهمة جديدة",
                  )),
            )
          ],
        )
      ],
    ));
  }

  void createTask() {
    Navigator.of(context).pushNamed('/createTask');
  }

  void goToProfile() {
    Navigator.of(context).pushNamed('/profilePage');
  }

  void logout() {
    Navigator.of(context).pushReplacementNamed("/login");
  }
}
