import 'package:flutter/material.dart';
import 'package:pandur/modules/home/pages/home_page.dart';
import 'package:pandur/modules/login/pages/login/login_page.dart';

import 'package:pandur/modules/splash/splash_page.dart';


import 'modules/login/pages/signup/signup_page.dart';



class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
       routes: {
        // "/splash": (_) => SplashPage(),
        "/": (_) => SplashPage(),
        "/login": (_) => LoginPage(),
        "/signup": (_) => SignUpPage(),
        "/home": (_) => HomePage(),
      },
    );
  }
}