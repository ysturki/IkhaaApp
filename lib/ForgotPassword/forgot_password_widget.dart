import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/snackbar.dart';
import 'package:flutter_salam/ForgotPassword/forgot_password_logic.dart';

class ForgotPasswordWidget extends StatefulWidget {
  final ForgotPasswordLogic logic;
  const ForgotPasswordWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  bool isLoading = false;
  bool sentSMS = false;
  bool verifiedOTP = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // widget.logic.loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sentSMS
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: emailController,
                            enabled: true,
                            decoration: InputDecoration(
                              hintText: 'البريد الالكتروني',
                              alignLabelWithHint: false,
                              label: Text(
                                'البريد الالكتروني',
                              ),
                            ),
                          ),
                        ),
                  sentSMS && !verifiedOTP
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: otpController,
                            enabled: true,
                            decoration: InputDecoration(
                              hintText: 'الرمز',
                              alignLabelWithHint: false,
                              label: Text(
                                'الرمز',
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  verifiedOTP
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: passwordController,
                            enabled: true,
                            decoration: InputDecoration(
                              hintText: 'كلمة السر الجديدة',
                              alignLabelWithHint: false,
                              label: Text(
                                'كلمة السر الجديدة',
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Expanded(
                          child: MyElevatedButton(
                              onPressed: sendSMS,
                              child:
                                  Text(sentSMS ? "ارسال" : "ازسال رسالة نصية")))
                    ],
                  )
                ],
              ));
  }

  sendSMS() {
    if (!sentSMS) {
      if (emailController.text.isNotEmpty) {
        if (mounted) {
          setState(() {
            sentSMS = true;
          });
        }
      } else {
        showSnackbar(context, "البريد الالكتروني غير صحيح");
      }
    } else if (!verifiedOTP) {
      if (otpController.text.isNotEmpty) {
        if (mounted) {
          setState(() {
            verifiedOTP = true;
          });
        }
      } else {
        showSnackbar(context, "الرمز غير صحيح");
      }
    } else {
      if (passwordController.text.isNotEmpty) {
        Navigator.of(context).pop();
        showSnackbar(context, "تم تغيير كلمة السر بنجاح");
      } else {
        showSnackbar(context, "كلمة المرور الجديدة غير صحيحة");
      }
    }
  }
}
