import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/snackbar.dart';
import 'package:flutter_salam/Login/login_logic.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  final LoginLogic logic;

  const LoginWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 40)),
          Center(
              child: Image(
                  height: 180,
                  width: 180,
                  image: AssetImage(
                    "assets/png/logo3.png",
                  ))),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      autocorrect: false,
                      controller: widget.logic.usernameController,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: SvgPicture.asset(
                                "assets/svg/Message.svg",
                                color: Colors.black,
                              )),
                          prefixIconConstraints: BoxConstraints(maxHeight: 30),
                          hintText: "اسم المستخدم",
                          alignLabelWithHint: true,
                          label: Text("اسم المستخدم")),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: TextField(
                      obscureText: showPassword,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: widget.logic.passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: SvgPicture.asset(
                              "assets/svg/Password.svg",
                              color: Colors.black,
                            )),
                        prefixIconConstraints: BoxConstraints(maxHeight: 30),
                        hintText: 'كلمة المرور',
                        label: Text('كلمة المرور'),
                        alignLabelWithHint: true,
                        suffixIcon: IconButton(
                          onPressed: switchPasswordView,
                          icon: Icon(!showPassword
                              ? Icons.remove_red_eye_sharp
                              : Icons.password_rounded),
                        ),
                      ),
                    )),
                Flexible(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: GestureDetector(
                            onTap: forgotPassword,
                            child: Text(
                              "نسيت كلمة السر؟",
                              style: TextStyle(color: Colors.grey),
                            )))),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: MyElevatedButton(
                            onPressed: login,
                            child: const Text("تسجيل الدخول"))),
                  ],
                )),
              ],
            ),
          ),
          Flexible(
              child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "تسجيل جديد",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: MyElevatedButton(
                              onPressed: () => register(true),
                              child: const Text("فرد مساهم")))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: MyElevatedButton(
                              onPressed: () => register(false),
                              child: const Text("جهة مستفيدة")))),
                ],
              )
            ],
          )),
        ]);
  }

  void switchPasswordView() {
    if (mounted) {
      setState(() {
        showPassword = !showPassword;
      });
    }
  }

  register(bool isViolator) async {
    Navigator.pushNamed(
      context,
      '/registerationPage',
      arguments: {'isViolator': isViolator},
    );
  }

  login() {
    if (widget.logic.usernameController.text.toLowerCase() == "person") {
      if (widget.logic.passwordController.text.toLowerCase() == "1234") {
        loginViolator();
      } else {
        showSnackbar(context, "كلمة السر غير صحيحة");
      }
    } else if (widget.logic.usernameController.text.toLowerCase() ==
        "company") {
      if (widget.logic.passwordController.text.toLowerCase() == "1234") {
        loginBeneficiary();
      } else {
        showSnackbar(context, "كلمة السر غير صحيحة");
      }
    } else {
      showSnackbar(context, "اسم المستخدم غير صحيح");
    }
  }

  loginViolator() async {
    context.read<AppProvider>().user = AppUserInfo(
        name: "ياسر تركستاني",
        email: "ysturki@gmail.com",
        password: "12345678",
        isViolator: true,
        age: "25",
        fee: 2500,
        occupation: "محلل نظم معلومات",
        phoneNumber: "059999999",
        nationalId: "1234567890",
        userId: "1");
    Navigator.of(context).pushReplacementNamed('/dashboardViolator');
  }

  loginBeneficiary() async {
    context.read<AppProvider>().user = AppUserInfo(
        name: "جمعية خيرية",
        email: "ysturki@gmail.com",
        password: "12345678",
        isViolator: false,
        age: "",
        fee: 2500,
        occupation: "-",
        phoneNumber: "059999999",
        nationalId: "123123",
        userId: "2");
    Navigator.of(context).pushReplacementNamed('/dashboardBeneficiary');
  }

  forgotPassword() async {
    Navigator.of(context).pushNamed('/forgotPasswordPage');
  }
}
