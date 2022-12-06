import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/snackbar.dart';
import 'package:flutter_salam/Registeration/registeration_logic.dart';
import 'package:provider/provider.dart';

class RegisterationWidget extends StatefulWidget {
  final RegisterationLogic logic;
  const RegisterationWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<RegisterationWidget> createState() => _RegisterationWidgetState();
}

class _RegisterationWidgetState extends State<RegisterationWidget> {
  bool isLoading = false;

  @override
  void initState() {
    // widget.logic.loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: SingleChildScrollView(child: getRegisterationFields())),
        Row(
          children: [
            Expanded(
                child: MyElevatedButton(
              onPressed: registerButton,
              child: Text("تسجيل"),
            ))
          ],
        )
      ],
    ));
  }

  Widget getRegisterationFields() {
    return widget.logic.isViolator
        ? getPersonRegisterationFields()
        : getOrgRegisterationFields();
  }

  Widget getOrgRegisterationFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'اسم الجهة',
              alignLabelWithHint: true,
              labelText: 'اسم الجهة',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'البريد الالكتروني',
              alignLabelWithHint: true,
              labelText: 'البريد الالكتروني',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'كلمة المرور',
              alignLabelWithHint: false,
              labelText: 'كلمة المرور',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'المدينة',
              alignLabelWithHint: false,
              labelText: 'المدينة',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'رقم التسجيل في الموارد البشرية',
              alignLabelWithHint: false,
              labelText: 'رقم التسجيل في الموارد البشرية',
            ),
          ),
        ),
      ],
    );
  }

  Widget getPersonRegisterationFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'الاسم الثلاثي',
              alignLabelWithHint: true,
              labelText: 'الاسم الثلاثي',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'البريد الالكتروني',
              alignLabelWithHint: true,
              labelText: 'البريد الالكتروني',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'كلمة المرور',
              alignLabelWithHint: false,
              labelText: 'كلمة المرور',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'رقم الهوية',
              alignLabelWithHint: false,
              labelText: 'رقم الهوية',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'العمر',
              alignLabelWithHint: false,
              label: Text('العمر'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'المهنة',
              alignLabelWithHint: false,
              label: Text(
                'المهنة',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              hintText: 'الجوال',
              alignLabelWithHint: false,
              label: Text(
                'الجوال',
              ),
            ),
          ),
        ),
      ],
    );
  }

  registerButton() async {
    updateUI(() {
      isLoading = true;
    });

    bool response = await widget.logic.saveData();

    showSnackbar(context, "تم التسجيل بنجاح");
    Navigator.of(context).pop();

    updateUI(() {
      isLoading = false;
    });
  }

  updateUI(Function func) {
    func();
    if (mounted) {
      setState(() {});
    }
  }
}
