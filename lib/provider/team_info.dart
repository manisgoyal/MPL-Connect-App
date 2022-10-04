// import 'package:flutter/material.dart';
// import 'package:mpl_connect/api.dart';

// class GameProvider extends ChangeNotifier {
//   String _id = "";
//   int _trackId = 0;
//   String _teamName = "";
//   int _penaltyCount = 0;
//   int _checkPointNum = 0;

//   void setId(String id) {
//     _id = id;
//     notifyListeners();
//   }

//   void setIrackId(int id) {
//     _trackId = id;
//     notifyListeners();
//   }

//   void setTeamName(String name) {
//     _teamName = name;
//     notifyListeners();
//   }

//   void setNumbers(int p, int c) {
//     _penaltyCount = p;
//     _checkPointNum = c;
//     //Call this whenever there is some change in any field of change notifier.
//     notifyListeners();
//   }

//   void updateNumbers() {
//     ApiConnector.penaltyCount(_id).then((value) => _penaltyCount = value);
//     ApiConnector.checkPointCount(_id).then(((value) => _checkPointNum = value));
//     //Call this whenever there is some change in any field of change notifier.
//     notifyListeners();
//   }

//   String get getTeamName => _teamName;

//   String get getId => _id;

//   int get getTrackId => _trackId;

//   int get getPenNum => _penaltyCount;

//   int get getChecks => _checkPointNum;
// }
