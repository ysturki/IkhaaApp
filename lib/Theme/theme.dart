import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  // This is a constructor that is called only once (when we initialize this class)
  ThemeProvider() {
    SharedPreferences.getInstance().then((pref) {
      final userDarkModePref = pref.getBool('darkMode');
      // default theme mode is light
      themeMode =
          (userDarkModePref ?? false) ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    });
  }
}

class AppThemes {
  // ====================================================================================
  //                                      Light Theme
  // ====================================================================================
  static final ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: AppColors.green,
      selectionHandleColor: AppColors.blue,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: Colors.white,
      surface: Colors.white,
    ),

    primaryColor: AppColors.primary,

    inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        suffixIconColor: Colors.black,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: AppColors.greyBackground,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        isDense: true),

    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 16, color: Colors.black),
      bodyText2: TextStyle(fontSize: 14, color: Colors.black),
      subtitle2: TextStyle(fontSize: 14, color: Colors.black),
      button: TextStyle(fontSize: 14, color: Colors.black),
      headline2: TextStyle(
          fontSize: 8, fontWeight: FontWeight.w700, color: Colors.white),
      headline4: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w700, color: Colors.white),
      headline5: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
      headline6: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(AppColors.primary),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.any((element) => element == MaterialState.disabled)) {
          return Colors.grey;
        } else {
          return AppColors.primary;
        }
      }),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.any((element) => element == MaterialState.disabled)) {
              return Colors.grey;
            } else {
              return AppColors.primary;
            }
          }),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))),
    ),
    // chipTheme: ChipThemeData(
    //   elevation: 0,
    //   pressElevation: 4,
    //   backgroundColor: Colors.transparent,
    //   selectedColor: AppColors.lightGreen.withAlpha((255 * 0.3).floor()),
    //   secondarySelectedColor:
    //       AppColors.lightGreen.withAlpha((255 * 0.3).floor()),
    //   disabledColor: Colors.transparent,
    //   deleteIconColor: AppColors.primary,
    //   checkmarkColor: AppColors.primary,
    //   labelStyle: TextStyle(fontSize: 16, color: AppColors.primary),
    //   secondaryLabelStyle: TextStyle(fontSize: 16, color: AppColors.primary),
    //   side: BorderSide(color: AppColors.primary),
    // ),
    errorColor: Colors.red,
    iconTheme: IconThemeData(color: AppColors.primary),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primary,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),
    toggleableActiveColor: AppColors.primary,
    bottomAppBarColor: Colors.white,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        foregroundColor: Colors.black,
        elevation: 0),
    tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(color: Colors.white)),
  );
}

class AppColors {
  static const Color greyBackground = Color.fromARGB(255, 243, 244, 244);
  static const Color primary = Colors.white;
  static const Color green = Color(0xFFC8E799);
  static const Color blue = Color(0xFFADDEE4);
  static const Color snackbar = Color.fromARGB(255, 145, 199, 207);

  static const LinearGradient gradient = LinearGradient(
      colors: [
        Color(0xFFADDEE4),
        Color(0xFFC8E799),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
}
