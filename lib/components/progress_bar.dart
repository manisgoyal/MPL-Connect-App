import 'package:flutter/material.dart';

Color check(int i, int checks) {
  // print(checks);
  // print(i);
  if (i < checks) {
    return const Color.fromARGB(255, 68, 177, 0);
  } else {
    return const Color.fromARGB(255, 255, 255, 255);
  }
}

Widget progressBar(int checkPoints) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [0, 1, 2, 3, 4]
        .map(
          (e) => Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: check(e, checkPoints),
                ),
              ),
              (e != 4)
                  ? Container(
                      height: 5,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: check(e + 1, checkPoints),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        )
        .toList(),
  );
}
