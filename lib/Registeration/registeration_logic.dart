class RegisterationLogic {
  final bool isViolator;

  const RegisterationLogic({required this.isViolator});
  Future<bool> saveData() async {
    Future.delayed(Duration(seconds: 2));
    return true;
  }
}
