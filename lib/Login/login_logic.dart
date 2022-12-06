import 'dart:async';

import 'package:flutter/material.dart';

class LoginLogic {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // AppServices firebase;

  bool loggedin() => true; //firebase.appAuth.loggedin();

  Future<bool> login() async {
    return true;
  }

  Future<bool> register() async {
    return true;
  }
}
