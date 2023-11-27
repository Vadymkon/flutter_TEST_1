import 'package:flutter/material.dart';
import 'package:testexample/extenstion.dart';
import 'package:testexample/widgets/texttypes.dart';

//dark
Color _darky = Color(0xFF001826);
Color _skiny = Color(0xFFdea16b);
Color _peorply = Color(0xFF9a93fd);
Color _bluey = Color(0xFF45578f);

final kDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: _darky,
  primaryColor: _bluey,
  cardColor: _skiny,
  shadowColor: _peorply,

  unselectedWidgetColor: _bluey,
  dialogBackgroundColor: _darky,

  appBarTheme: AppBarTheme(
    color: _darky
  ),
  textTheme: TextTheme(
    labelLarge: headerOne.copyWith(color: _peorply),
    labelMedium: headerTwo.copyWith(color: _peorply),
    labelSmall: headerThree.copyWith(color: _skiny),
    titleSmall: headerFour.copyWith(color: _skiny.withOpacity(0.6))
  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(headerTwo),
            backgroundColor: MaterialStateProperty.all<Color>(_peorply),
            foregroundColor: MaterialStateProperty.all<Color>(_darky)
            //MaterialStateProperty.all<Color>(_bluey)
        )),
);

//light

Color _whity = Color(0xFFffffff);
Color _redy = Color(0xFF986d8e);
Color _greytyDark = Color(0xFFe5be90);
Color _greytyLight = Color(0xFFfff5e9);
Color _blacky = Color(0xFF212121);



final kLightTheme = ThemeData.dark().copyWith(
  primaryColor: _greytyLight,
  scaffoldBackgroundColor: _whity,
  cardColor: _redy,
  shadowColor: _greytyDark,

  unselectedWidgetColor: _blacky,
  dialogBackgroundColor: _whity,

  appBarTheme: AppBarTheme(
      color: _whity
  ),
  textTheme: TextTheme(
      labelLarge: headerOne.copyWith(color: _greytyDark),
      labelMedium: headerTwo.copyWith(color: _greytyDark),
      labelSmall: headerThree.copyWith(color: _redy),
      titleSmall: headerFour.copyWith(color: _redy.withOpacity(0.6))
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(headerTwo),
          backgroundColor: MaterialStateProperty.all<Color>(_greytyDark),
          foregroundColor: MaterialStateProperty.all<Color>(_whity)
        //MaterialStateProperty.all<Color>(_bluey)
      )),
);

/*
final kLightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        color: Colors.cyanAccent
    )
);
 */