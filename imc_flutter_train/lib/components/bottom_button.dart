import 'package:flutter/material.dart';
import 'package:imc_flutter_train/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.onTap,
    required this.buttonTitle,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: 20.0),
          color: kBottomContainerColor,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kBottomContainerHeight,
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            ),
          ),
        ));
  }
}
