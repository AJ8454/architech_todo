import 'package:architech_todo/src/core/responsive/app_responsive.dart';
import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColor.dark,
      primaryColorLight: AppColor.light,
      primaryColorDark: AppColor.dark,
      appBarTheme: const AppBarTheme(
        elevation: 2,
        iconTheme: IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.blue,
        titleTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontFamily: 'poppins',
          fontWeight: FontWeight.w600,
        ),
        // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        //   statusBarColor: AppColor.white,
        // ),
      ),
      scaffoldBackgroundColor: AppColor.light,
      cardColor: AppColor.cardLight,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.light, width: 1),
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.white,
        elevation: 8,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      dividerColor: AppColor.dividerLight,
      splashColor: AppColor.transparent,
      iconTheme: const IconThemeData(color: AppColor.black),
      fontFamily: 'poppins',
      textTheme: ThemeData.light().textTheme,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColor.blue),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius)),
        buttonColor: AppColor.red,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.blue,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.blue,
          backgroundColor: AppColor.backgroundLight,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppResponsive.kBorderRadius))),
          side: const BorderSide(color: AppColor.black, width: 1.5),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.only(left: 10, top: 20),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(color: AppColor.gray600, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(color: AppColor.gray100, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(color: AppColor.blue, width: 1.5),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.blue; // the color when checkbox is selected;
            }
            return Colors.grey; //the color when checkbox is unselected;
          },
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColor.light,
      primaryColorLight: AppColor.dark,
      primaryColorDark: AppColor.dark,
      appBarTheme: const AppBarTheme(
        elevation: 2,
        iconTheme: IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.blue,
        titleTextStyle: TextStyle(
            color: AppColor.white,
            fontSize: 16,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600),
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   systemNavigationBarColor: AppColor.blue,
        //   statusBarColor: AppColor.blue,
        //   statusBarBrightness: Brightness.dark,
        //   statusBarIconBrightness: Brightness.light,
        // ),
      ),
      scaffoldBackgroundColor: AppColor.backgroundDark,
      cardColor: AppColor.cardDark,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.cardDark),
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.dark,
        elevation: 10,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      dividerColor: AppColor.dividerDark,
      splashColor: AppColor.transparent,
      iconTheme: const IconThemeData(color: AppColor.white),
      fontFamily: 'monseterrat',
      textTheme: ThemeData.dark().textTheme,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColor.blue),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        buttonColor: AppColor.red,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.blue,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.blue,
          backgroundColor: AppColor.backgroundDark,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppResponsive.kBorderRadius))),
          side: const BorderSide(color: AppColor.white, width: 1.5),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.only(left: 10, top: 20),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIconColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(color: AppColor.gray600, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(color: AppColor.white, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(color: AppColor.blue, width: 1.5),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.blue; // the color when checkbox is selected;
            }
            return Colors.grey; //the color when checkbox is unselected;
          },
        ),
      ),
    );
  }
}
