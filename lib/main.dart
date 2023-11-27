// name: testexample

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testexample/extenstion.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:testexample/pages/menu.dart';
import 'package:testexample/theme.dart';
import 'generated/l10n.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      AdaptiveTheme(
        light: kLightTheme,
        dark: kLightTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: light,
              darkTheme: dark,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,

              initialRoute: '/',
              routes: {
                '/': (context) => const Menu(),
                // '/history': (context) => const History(),
              },
            ),
      ));
}
