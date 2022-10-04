import 'package:flutter/material.dart';
// import 'package:mpl_connect/api.dart';
// import 'package:mpl_connect/routes/instructions.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill)),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 3),
                        child: const Image(
                            image: AssetImage("assets/images/siamLogo.png"),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "SIAM-VIT welcomes you!",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 6),
                        child: const Image(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Made with ❤️ by SIAM VIT",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    textScaleFactor: 1.7,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/instruct');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFF3AE3D)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Next →',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
