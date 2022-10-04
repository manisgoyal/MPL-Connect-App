import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes.dart';

class HomeCheck extends StatefulWidget {
  const HomeCheck({Key? key}) : super(key: key);

  @override
  HomeCheckState createState() => HomeCheckState();
}

class HomeCheckState extends State<HomeCheck> {
  bool isFirstLaunch = false;

  sharedState() {
    MySharedPreferences.instance
        .getBooleanValue("isfirstRun")
        .then((value) => setState(() {
              isFirstLaunch = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return isFirstLaunch ? const Onboarding() : const Login();
  }
}

class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();

  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }
}
