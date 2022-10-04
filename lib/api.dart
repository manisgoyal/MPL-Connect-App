// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mpl_connect/clues/clues.dart';
// import 'package:mpl_connect/provider/team_info.dart';
// import 'package:provider/provider.dart';

// import 'routes/game.dart';
// import 'package:hive/hive.dart';

class ApiConnector {
  static Future<List> login(
    String teamId,
    String teamName,
    BuildContext context,
  ) async {
    const url = "https://mpl-connect.herokuapp.com/api/login";
    // print(url);
    // print(teamId);
    // print(teamName);
    var body = json.encode({"teamId": teamId, "teamName": teamName});
    // print(body);
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    var respBody = response.body;
    if (respBody == '"User doesn\'t exist"') {
      SnackBar msg = SnackBar(
        backgroundColor: const Color.fromARGB(80, 255, 255, 255),
        behavior: SnackBarBehavior.floating,
        width: MediaQuery.of(context).size.width / 2,
        // margin: ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: const Text(
          "User doesn't exist",
          textAlign: TextAlign.center,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(msg);
    } else {
      var respMap = json.decode(respBody);
      // print(respMap);
      String mainId = respMap["_id"];
      int trackId = respMap["trackId"];
      int checkCount = respMap["checkPoint"];
      int penCount = respMap["penaltyCount"];
      // print([mainId, trackId, penCount, checkCount]);
      return [mainId, trackId, penCount, checkCount];
    }
    return [];
  }

  static List<dynamic> getListOfClues({required int trackId}) {
    // print(MasterClues[trackId]);
    return masterClues[trackId];
  }

  static Future<void> otpCheck(
      String id, String answer, BuildContext context) async {
    const url = "https://mpl-connect.herokuapp.com/api/finalOtpCheck";
    // print(url);
    // print(id);
    // print(answer);
    var body = json.encode({"id": id, "answer": answer});
    // print(body);
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {"Content-Type": "application/json"},
    );
    var respBody = response.body;
    if (respBody == '"Completed"') {
      Navigator.of(context).pushReplacementNamed("/settings");
    } else {
      SnackBar msg = SnackBar(
        backgroundColor: const Color.fromARGB(80, 255, 255, 255),
        behavior: SnackBarBehavior.floating,
        width: MediaQuery.of(context).size.width / 2,
        // margin: ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: const Text(
          "Try Again",
          textAlign: TextAlign.center,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(msg);
    }
  }

  static Future<int> penaltyCount(String id) async {
    final url = "https://mpl-connect.herokuapp.com/api/penaltyCount/$id";
    var resp = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );
    int respBody = json.decode(resp.body);
    return respBody;
  }

  static Future<int> checkPointCount(String id) async {
    final url = "https://mpl-connect.herokuapp.com/api/checkPointCount/$id";
    var resp = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );
    int respBody = json.decode(resp.body);
    return respBody;
  }
}
