import 'package:flutter/material.dart';

class ProfileLogic {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController idController = TextEditingController();

  Future<bool> saveData() async {
    Future.delayed(Duration(seconds: 2));
    return true;
  }
}
