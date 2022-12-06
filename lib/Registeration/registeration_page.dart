import 'package:flutter/material.dart';
import 'package:flutter_salam/Registeration/registeration_logic.dart';
import 'package:flutter_salam/Registeration/registeration_widget.dart';

class RegisterationPage extends StatelessWidget {
  const RegisterationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, bool> routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, bool>;
    bool isViolator = routes["isViolator"] ?? false;
    RegisterationLogic logic = RegisterationLogic(isViolator: isViolator);
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
          title: Text("صفحة التسجيل"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: RegisterationWidget(logic: logic)));
  }
}
