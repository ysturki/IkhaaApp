import 'package:flutter/material.dart';
import 'package:flutter_salam/profile/profile_logic.dart';
import 'package:flutter_salam/profile/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileLogic logic = ProfileLogic();
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
          title: Text("الملف الشخصي"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ProfileWidget(logic: logic)));
  }
}
