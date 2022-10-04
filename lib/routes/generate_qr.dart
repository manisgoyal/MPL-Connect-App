import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:ui';
// import 'dart:io';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';

class GenerateQR extends StatelessWidget {
  final String data;
  GenerateQR({super.key, required this.data});

  // static const double _topSectionTopPadding = 50.0;
  // static const double _topSectionBottomPadding = 20.0;
  // static const double _topSectionHeight = 50.0;

  final GlobalKey globalKey = GlobalKey();
  // String _inputErrorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3AE3D),
        title: const Text('Your QR Code'),
      ),
      body: _contentWidget(context),
    );
  }

  _contentWidget(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data: data,
                  size: 0.3 * bodyHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
