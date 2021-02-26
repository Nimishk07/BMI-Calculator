import 'package:flutter/material.dart';
import 'constants.dart';
import 'result.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.butttonTitle});

  final Function onTap;
  final String butttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContaieerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kbottomContainerColor,
        ),
        child: Center(
          child: Text(
            butttonTitle,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
