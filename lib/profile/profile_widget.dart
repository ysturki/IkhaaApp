import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_button.dart';
import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/profile_picture_widget.dart';
import 'package:flutter_salam/Common/snackbar.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:flutter_salam/profile/profile_logic.dart';

import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  final ProfileLogic logic;
  const ProfileWidget({Key? key, required this.logic}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool inEditMode = false;
  bool isLoading = false;
  bool showPassword = false;

  @override
  void initState() {
    // widget.logic.loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppUserInfo user = context.read<AppProvider>().user;

    updateControllers();
    return SafeArea(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProfilePicture(
                      picture: user.picture,
                      id: user.userId,
                    ),
                  ],
                ),
                Flexible(
                    child: SingleChildScrollView(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        enabled: inEditMode,
                        controller: widget.logic.nameController,
                        decoration: InputDecoration(
                          hintText: 'الاسم',
                          alignLabelWithHint: true,
                          label: Text('الاسم'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        enabled: inEditMode,
                        controller: widget.logic.idController,
                        decoration: InputDecoration(
                          hintText:
                              user.isViolator ? 'رقم الهوية' : "رقم الشركة",
                          alignLabelWithHint: true,
                          label: Text(
                              user.isViolator ? 'رقم الهوية' : "رقم الشركة"),
                        ),
                      ),
                    ),
                    !user.isViolator
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              enabled: inEditMode,
                              controller: widget.logic.ageController,
                              decoration: InputDecoration(
                                hintText: 'العمر',
                                alignLabelWithHint: true,
                                label: Text('العمر'),
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        enabled: inEditMode,
                        controller: widget.logic.emailController,
                        decoration: InputDecoration(
                          hintText: 'الايميل',
                          alignLabelWithHint: true,
                          label: Text('الايميل'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        obscureText: !showPassword,
                        enabled: inEditMode,
                        controller: widget.logic.passwordController,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور',
                          alignLabelWithHint: true,
                          label: Text('كلمة المرور'),
                          suffixIcon: IconButton(
                            onPressed: switchPasswordView,
                            icon: Icon(!showPassword
                                ? Icons.remove_red_eye_sharp
                                : Icons.password_rounded),
                          ),
                        ),
                      ),
                    ),
                    !user.isViolator
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              enabled: false,
                              controller: widget.logic.feeController,
                              decoration: InputDecoration(
                                hintText: 'مجموع المخالفات',
                                alignLabelWithHint: true,
                                label: Text('مجموع المخالفات'),
                              ),
                            ),
                          ),
                    !user.isViolator
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              enabled: false,
                              controller: widget.logic.hoursController,
                              decoration: InputDecoration(
                                hintText: 'عدد الساعات',
                                alignLabelWithHint: true,
                                label: Text('عدد الساعات'),
                              ),
                            ),
                          ),
                    !user.isViolator
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              enabled: inEditMode,
                              controller: widget.logic.occupationController,
                              decoration: InputDecoration(
                                hintText: 'الوظيفة',
                                alignLabelWithHint: true,
                                label: Text('الوظيفة'),
                              ),
                            ),
                          ),
                  ],
                ))),
                Row(
                  children: [
                    Expanded(
                      child: MyElevatedButton(
                          onPressed: () => editUpdateButton(),
                          child: Text(inEditMode ? "حفظ" : "تعديل")),
                    )
                  ],
                )
              ]));
  }

  updateControllers() {
    AppUserInfo user = context.read<AppProvider>().user;
    widget.logic.ageController.text = user.age;
    widget.logic.nameController.text = user.name;
    widget.logic.emailController.text = user.email;
    widget.logic.passwordController.text = user.password;
    widget.logic.feeController.text = "${user.fee}";
    widget.logic.hoursController.text = "${user.getHours()}";
    widget.logic.occupationController.text = user.occupation;
    widget.logic.idController.text = user.nationalId;
  }

  void switchPasswordView() {
    if (mounted) {
      setState(() {
        showPassword = !showPassword;
      });
    }
  }

  editUpdateButton() async {
    if (inEditMode) {
      updateUI(() {
        isLoading = true;
      });

      bool response = await widget.logic.saveData();

      updateUI(() {
        isLoading = false;
        inEditMode = false;
      });

      showSnackbar(
        context,
        'تم حفظ البيانات بنجاح',
      );

      Navigator.pop(context);
    } else {
      updateUI(() {
        inEditMode = true;
      });
    }
  }

  updateUI(Function func) {
    func();
    if (mounted) {
      setState(() {});
    }
  }

  void editProfilePicture() {}
}
