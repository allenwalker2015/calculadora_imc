import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class GenderCard extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color color;
  final Function onPress;
  GenderCard({this.icon, this.label, this.color, this.onPress});
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: color,
      onPress: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(
            height: 15,
          ),
          Text(
            label,
            style: kLabelTextStyle,
          )
        ],
      ),
    );
  }
}
