import 'package:flutter/material.dart';

// import 'login.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

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
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            shadowColor: MaterialStateProperty.all(
                                const Color.fromARGB(148, 243, 173, 61)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFF3AE3D)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            fixedSize:
                                MaterialStateProperty.all(const Size(200, 50))),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Made with ❤️ by SIAM VIT",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          textScaleFactor: 0.7,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
