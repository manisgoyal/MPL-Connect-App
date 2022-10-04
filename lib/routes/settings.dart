import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/custom_card.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  Future<void> _launchUrl(String address) async {
    final Uri url = Uri.parse(address);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  _launchCaller(String number) async {
    final Uri url = Uri.parse(number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final List<Map<String, String>> _poc = [
    {"num": "tel:+917992454046", "index": "1"}, // Ritu
    {"num": "tel:+919408520316", "index": "2"}, // Dharmik
    {"num": "tel:+919507111011", "index": "3"}, // Shivam
  ];
  final List<Map<String, dynamic>> _addresses = [
    {
      "name": "Our Instagram",
      "icon": Icons.camera_alt_outlined,
      "address": "https://www.instagram.com/siamvit/"
    },
    {
      "name": "Our Website",
      "icon": Icons.language,
      "address": "https://www.siamvit.in/"
    },
    {
      "name": "Our Youtube",
      "icon": Icons.play_arrow,
      "address": "https://www.youtube.com/c/SIAMVIT"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          // centerTitle: true,
          title: Container(
            margin: const EdgeInsets.only(left: 16),
            child: const Text(
              'Settings',
              maxLines: 1,
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SafeArea(
                  child: customCard(
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 1.2,
                      // height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Are you lost baby girl?",
                              textAlign: TextAlign.center,
                              textScaleFactor: 2.1,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Column(
                              children: _poc.map((e) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFFF3AE3D)),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    onPressed: () => _launchCaller(e["num"]!),
                                    child: Text(
                                      "Person ${e["index"]}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                      children: _addresses.map((item) {
                    return GestureDetector(
                      onTap: (() => _launchUrl(item["address"])),
                      child: Card(
                        elevation: 3,
                        color: const Color.fromARGB(41, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 15),
                                child: Icon(
                                  item["icon"],
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                item["name"],
                                textScaleFactor: 1.3,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList()),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/githubPic.jpg'),
                          radius: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.copyright,
                          color: Color.fromARGB(255, 173, 173, 173),
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '@manisgoyal',
                          textScaleFactor: 2.2,
                          style: TextStyle(
                            color: Color.fromARGB(255, 173, 173, 173),
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
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
          ),
        ],
      ),
    );
  }
}
