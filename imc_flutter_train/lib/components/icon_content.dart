import 'package:flutter/material.dart';
import 'package:imc_flutter_train/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
