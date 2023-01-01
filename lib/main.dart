import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nasa_flutter/config/config.dart';
import 'package:nasa_flutter/firebase_options.dart';
import 'package:nasa_flutter/modules/registration/view/registration_view.dart';

import 'modules/login/view/login_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () async {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appLightTheme,
      darkTheme: AppTheme().appDarkTheme,
      themeMode: ThemeMode.system,
      home: LoginView(),
    );
  }
}

void setStatusBarIconsColor({required BuildContext context}) {
  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
  ));
}
