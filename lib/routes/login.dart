// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mpl_connect/api.dart';
// import 'package:mpl_connect/provider/team_info.dart';
import 'package:mpl_connect/routes/game.dart';
// import 'package:provider/provider.dart';
import '../components/custom_card.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final teamIdController = TextEditingController();
  final teamNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    teamIdController.dispose();
    teamNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Login',
            maxLines: 1,
            textScaleFactor: 1.5,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: customCard(
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Team ID',
                                  style: TextStyle(color: Colors.white),
                                  textScaleFactor: 1.5,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    gapPadding: 5,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  hintText: 'Enter Team ID',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                keyboardType: TextInputType.number,
                                controller: teamIdController,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Team Name',
                                  style: TextStyle(color: Colors.white),
                                  textScaleFactor: 1.5,
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    gapPadding: 5,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  hintText: 'Enter Team Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                controller: teamNameController,
                              ),
                            ],
                          ),
                        ),
                        // Consumer<GameProvider>(
                        //     builder: (context, teamInfo, child) {
                        //   return
                        Container(
                          margin: const EdgeInsets.all(30),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 255, 213, 73),
                              ),
                            ),
                            onPressed: () async {
                              if (teamIdController.text != "" &&
                                  teamNameController.text != "") {
                                List tobeIn = [];
                                await ApiConnector.login(
                                  teamIdController.text,
                                  teamNameController.text,
                                  context,
                                ).then((value) => tobeIn = value);
                                if (tobeIn.isNotEmpty) {
                                  // teamInfo.setId(tobeIn[0]);
                                  // teamInfo.setIrackId(tobeIn[1]);
                                  // teamInfo
                                  //     .setTeamName(teamNameController.text);
                                  // teamInfo.setNumbers(tobeIn[2], tobeIn[3]);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                    return Game(
                                      teamId: tobeIn[0],
                                      tName: teamNameController.text,
                                      trId: tobeIn[1],
                                      check: tobeIn[3],
                                      pen: tobeIn[2],
                                    );
                                  }));
                                } else {
                                  SnackBar msg = SnackBar(
                                    backgroundColor:
                                        const Color.fromARGB(80, 255, 255, 255),
                                    behavior: SnackBarBehavior.floating,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    // margin: ,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    content: const Text(
                                      "Correct Team Details",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(msg);
                                }
                              } else {
                                SnackBar msg = SnackBar(
                                  backgroundColor:
                                      const Color.fromARGB(80, 255, 255, 255),
                                  behavior: SnackBarBehavior.floating,
                                  width: MediaQuery.of(context).size.width / 2,
                                  // margin: ,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  content: const Text(
                                    "Enter Your Team Details",
                                    textAlign: TextAlign.center,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(msg);
                              }
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          // );
                          // }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
