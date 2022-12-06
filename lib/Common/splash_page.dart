import 'package:flutter/material.dart';
import 'package:flutter_salam/Login/login_page.dart';
import 'package:flutter_salam/Theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initSplashScreen() async {
    Future.wait<bool>([splashScreenDelay()])
        .then((values) async {
          // Ohterwise, if token is NOT available, navigate to [LoginScreen]
          navigateToLoginScreen();
        })
        .timeout(Duration(seconds: 5))
        .onError((onError, stackTrace) {
          print('Could not get token because of most probably time out');
          navigateToLoginScreen();
        });
  }

  Future<bool> splashScreenDelay() async {
    await Future.delayed(Duration(milliseconds: 1500));
    return true;
  }

  @override
  void initState() {
    super.initState();
    initSplashScreen();
  }

  void navigateToLoginScreen() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 2500),
      opaque: true,
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
      transitionsBuilder: (context, animation, _, child) {
        return Opacity(
          opacity: animation.value < 0.5 ? 0 : animation.value,
          child: child,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: AppColors.gradient,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Hero(
              tag: 'Icon',
              child: Image(
                image: AssetImage('assets/png/logo.png'),
                height: 250,
              ),
            ),
          )),
    );
  }
}
