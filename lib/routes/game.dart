import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mpl_connect/api.dart';
import 'package:mpl_connect/components/custom_card.dart' as cc;
import 'package:mpl_connect/components/progress_bar.dart';
// import 'package:mpl_connect/provider/team_info.dart';
import 'package:mpl_connect/routes/routes.dart';
// import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  final String teamId, tName;
  final int trId, pen, check;

  const Game(
      {Key? key,
      required this.teamId,
      required this.tName,
      required this.trId,
      required this.check,
      required this.pen})
      : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late int checkPoint, penalty;

  @override
  void initState() {
    super.initState();
    clues = ApiConnector.getListOfClues(trackId: widget.trId);
    checkPoint = widget.check;
    penalty = widget.pen;
  }

  late List<dynamic> clues;
  @override
  Widget build(BuildContext context) {
    return (checkPoint > 5)
        ? Settings()
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Settings()));
                    },
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                )
              ],
              centerTitle: false,
              title: Container(
                // padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                child: const Image(
                    image: AssetImage("assets/images/siamLogo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.fill)),
                ),
                // ChangeNotifierProvider<GameProvider>(create: (_) {
                //   GameProvider newOne = GameProvider();
                //   newOne.setId(widget.teamId);
                //   return newOne;
                // }, builder: (context, child) {
                // return
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: cc.customCard(
                            Container(
                              width: MediaQuery.of(context).size.height / 3,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Text(
                                widget.tName,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                textScaleFactor: 1.5,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        CarouselSlider.builder(
                          itemCount: 6,
                          options: CarouselOptions(
                              aspectRatio: 1 / 1,
                              autoPlay: false,
                              enableInfiniteScroll: false,
                              height: MediaQuery.of(context).size.height / 3),
                          itemBuilder: (context, index, realIndex) {
                            return cc.customCard(SafeArea(
                                child:
                                    clueEach(clues[index], index, checkPoint)));
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red,
                              ),
                              child: RichText(
                                textScaleFactor: 1.3,
                                text: TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Penalty : ',
                                    ),
                                    TextSpan(
                                        text: '$penalty',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 30),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFF3AE3D)),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      ApiConnector.penaltyCount(widget.teamId)
                                          .then((value) => penalty = value);
                                      ApiConnector.checkPointCount(
                                              widget.teamId)
                                          .then(
                                              ((value) => checkPoint = value));
                                    });
                                  },
                                  icon: const Icon(Icons.update_sharp)),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              progressBar(checkPoint),
                            ],
                          ),
                        ),
                        (checkPoint >= 5)
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OtpTextField(
                                      numberOfFields: 6,
                                      borderColor: const Color(0xFFF3AE3D),
                                      showFieldAsBox: true,
                                      cursorColor: const Color(0xFFF3AE3D),
                                      textStyle: const TextStyle(
                                          color: Color(0xFFF3AE3D)),
                                      enabledBorderColor:
                                          const Color(0xFFF3AE3D),
                                      focusedBorderColor:
                                          const Color(0xFFF3AE3D),
                                      keyboardType: TextInputType.text,
                                      onSubmit: (String verificationCode) {
                                        ApiConnector.otpCheck(
                                            widget.teamId,
                                            verificationCode.toUpperCase(),
                                            context);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(40),
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 6,
                                    vertical: 20),
                                // width: MediaQuery.of(context).size.width / 3,
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFF3AE3D),
                                    ),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size(300, 55)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(3),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),

                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => GenerateQR(
                                                data: widget.teamId)));
                                  },
                                  label: const Text(
                                    "Open QR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 25),
                                  ),
                                  icon: const Icon(
                                    Icons.qr_code,
                                    color: Colors.black,
                                  ),
                                  //Button having rounded rectangle border
                                ),
                              ),
                      ],
                    ),
                  ),
                  // );
                  // }
                ),
              ],
            ),
          );
  }
}

Widget clueEach(dynamic item, int i, int checkpoint) {
  if (i > checkpoint) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Image(image: AssetImage("assets/images/logo.png"), height: 100),
        Text(
          "Complete previous task for the clue",
          style: TextStyle(color: Colors.white),
        )
      ]),
    );
  }
  if (i == 2) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          item,
          style: const TextStyle(color: Colors.white),
          textScaleFactor: 1.6,
        ),
      ),
    );
  }
  if (i == 5) {
    var items = List<String>.from(item);
    return SingleChildScrollView(
      child: Column(
          children: items.map((clue) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            clue,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList()),
    );
  }
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 27, 82, 128)),
    child: Image(image: NetworkImage(item)),
  );
}
