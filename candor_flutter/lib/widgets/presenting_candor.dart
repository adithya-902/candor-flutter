import 'package:candor_flutter/utils/colours.dart';
import 'package:flutter/material.dart';

class presenting_candor extends StatelessWidget {
  const presenting_candor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230,
          width: 400,
          padding: const EdgeInsets.all(12),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
            color: theYellowColor,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
              color: theRedColor,
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                color: theGreenColor,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: primaryColor,
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Presenting',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: mobileBackgroundColor,
                            fontFamily: "Lobster"),
                      ),
                    ),
                    Text(
                      "Candor",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 80,
                          color: mobileBackgroundColor,
                          fontFamily: "Lobster"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}