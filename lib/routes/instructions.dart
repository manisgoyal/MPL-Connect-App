import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

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
                customCard(
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: 3 * MediaQuery.of(context).size.width / 4,
                    child: RawScrollbar(
                      thumbColor: const Color.fromARGB(206, 88, 88, 88),
                      thumbVisibility: true,
                      thickness: 3,
                      radius: const Radius.circular(10),
                      scrollbarOrientation: ScrollbarOrientation.right,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text(
                                "General Instructions",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                textScaleFactor: 1.5,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "You are required to make teams of 3 for this event. Anyone who is unable to find/join a team will be assisted by SIAM members in doing the same.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "There will be a total of 5 rounds in this event.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "After finishing the first round at CDMM, it is mandatory for all participants to go to Technology Tower, before going to the location for the second round, to get a hand stamp for the event. The stamp will be checked by SIAM members in further rounds. Anyone found without a stamp will be disqualified. ",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "At every location, look out for a SIAM member who will provide you with instructions for the ongoing round. Get the QR code, from your MPL application, scanned by them to verify if you’re on the right path and to get clues for the round.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "Qualification for the next and final event will be done on the basis of the time taken by the team to finish all 5 rounds.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "All clues are spread out over VIT campus only. No participant should leave the campus under any circumstance..",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "Decisions made by the SIAM members will be final and binding.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "VIT rules and regulations should be adhered at all points of time.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "Any kind of offensive behavior, derogatory actions and obscene display will not be tolerated. Strict actions will be taken accordingly.",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "Lastly, work together as a team and have loads of fun exploring the campus :) Hope to see you in the final round!",
                                      textAlign: TextAlign.justify,
                                      textScaleFactor: 1,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8),
                  child: const Text(
                    "By continuing wth the event, I agree to abide by VIT's and MPL's rules.",
                    textAlign: TextAlign.justify,
                    textScaleFactor: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/landing');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFF3AE3D)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 40)),
                      ),
                      child: const Text(
                        'I Agree',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget customCard(Widget child) {
  return Card(
    elevation: 8.0,
    color: const Color.fromARGB(72, 88, 88, 88),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFF3AE3D))),
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      padding: const EdgeInsets.all(15),
      child: child,
    ),
  );
}
