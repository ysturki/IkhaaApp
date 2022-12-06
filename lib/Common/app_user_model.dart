class AppUserInfo {
  String name;
  String email;
  String password;
  bool isViolator;
  String age;
  double fee;
  String occupation;
  String phoneNumber;
  String nationalId;
  String picture;
  String userId;

  AppUserInfo(
      {required this.name,
      required this.email,
      required this.password,
      required this.isViolator,
      required this.age,
      required this.fee,
      required this.occupation,
      required this.phoneNumber,
      required this.nationalId,
      this.picture = "assets/svg/user.svg",
      required this.userId});

  int getHours() {
    return (fee / 10).round();
  }
}
