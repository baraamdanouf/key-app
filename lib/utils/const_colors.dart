import 'package:flutter/material.dart';

//regionColor
const primaryColor = Color(0xff338e27);
const secondaryColor = Color(0xff506c59);
const textColor = Color(0xff505050);
const grey = Color(0xffb4b1b1);
const greyLite = Color(0xffe4e4e4);
const purple = Color(0xffa368f3);
const pink = Color(0xfff08daf);
const pinkLite = Color(0xffe2c5c9);
const red = Color(0xffee1414);
const yellow = Color(0xfffccf5e);
const brown = Color(0xffb17f57);
const brownLight = Color(0xffc2b2b2);
//endregion Color

class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Almarai',
      ),
      primaryColor: const Color(0xff3b7f04),
      scaffoldBackgroundColor: Colors.white,
      indicatorColor: Colors.black87,
      dividerColor: const Color(0xfff6f6f6),
      hintColor: const Color(0xff3b7f04),
      buttonColor: const Color(0xff506c59),
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.white, elevation: 0),
  );

  final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Almarai',
    ),
    primaryColor: const Color(0xff295704),
    indicatorColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFF000000),
    dividerColor: const Color(0xffcecece),
    hintColor: const Color(0xffacabab),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF000000), elevation: 0,),
    buttonColor: Colors.white
  );
}
