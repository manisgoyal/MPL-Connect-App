import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:mpl_connect/provider/team_info.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => GameProvider(),
    // child:
    MyApp(prefs: prefs, isFirstTime: isFirstTime
        // ),
        ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final SharedPreferences prefs;
  static const boolKey = 'isFirstTime';
  const MyApp({
    Key? key,
    required this.isFirstTime,
    required this.prefs,
  }) : super(key: key);

  Widget home() {
    if (isFirstTime) {
      return const Onboarding();
    } else {
      return const Landing();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'sfPro',
      ),
      routes: {
        "/instruct": (context) => const Instructions(),
        "/landing": (context) => const Landing(),
        "/login": (context) => const Login(),
        "/onboarding": (context) => const Onboarding(),
        "/settings": (context) => Settings()
      },
      home: home(),
    );
  }
}
