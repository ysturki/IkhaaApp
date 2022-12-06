import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_salam/AllTasks/all_tasks_page.dart';
import 'package:flutter_salam/Common/splash_page.dart';
import 'package:flutter_salam/DashboardBeneficiary/dashboard_ben_page.dart';
import 'package:flutter_salam/DashboardViolator/dashboard_vio_page.dart';
import 'package:flutter_salam/ForgotPassword/forgot_password_page.dart';
import 'package:flutter_salam/Login/login_page.dart';
import 'package:flutter_salam/CreateTask/create_task_page.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:flutter_salam/Registeration/registeration_page.dart';
import 'package:flutter_salam/TaskDetails/task_details_page.dart';
import 'package:flutter_salam/Theme/theme.dart';
import 'package:flutter_salam/profile/profile_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AppProvider()),
        ],
        child: Builder(builder: (context) {
          return ChangeNotifierProvider(
              create: (context) =>
                  AppProvider(), // ← create/init your state model
              child: MaterialApp(
                localizationsDelegates: [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
                ],
                locale: Locale("ar"),
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Salam Team',
                routes: {
                  '/splash': (context) => SplashPage(),
                  '/login': (context) => LoginPage(),
                  '/dashboardBeneficiary': (context) =>
                      DashboardBeneficiaryPage(),
                  '/dashboardViolator': (context) => DashboardViolatorPage(),
                  '/createTask': (context) => CreateTaskPage(),
                  '/allTasksPage': (context) => AllTasksPage(),
                  '/profilePage': (context) => ProfilePage(),
                  '/registerationPage': (context) => RegisterationPage(),
                  '/forgotPasswordPage': (context) => ForgotPasswordPage(),
                  '/taskDetailsPage': (context) => TaskDetailsPage(),
                },
                initialRoute: '/splash',
                theme: AppThemes.lightTheme,
                // darkTheme: AppThemes.darkTheme,
                // themeMode: themeNotifier.themeMode,
              ));
        }));
  }
}
