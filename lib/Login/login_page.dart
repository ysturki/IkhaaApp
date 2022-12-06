import 'package:flutter/material.dart';
import 'package:flutter_salam/Login/login_logic.dart';
import 'package:flutter_salam/Login/login_widget.dart';
import 'package:flutter_salam/Provider/app_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = LoginLogic();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: LoginWidget(
        logic: logic,
      ),
    ));
  }
}
