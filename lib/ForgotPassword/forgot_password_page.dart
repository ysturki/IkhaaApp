import 'package:flutter/material.dart';
import 'package:flutter_salam/ForgotPassword/forgot_password_logic.dart';
import 'package:flutter_salam/ForgotPassword/forgot_password_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPasswordLogic logic = ForgotPasswordLogic();
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
          title: Text("نسيت كلمة السر"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ForgotPasswordWidget(logic: logic)));
  }
}
