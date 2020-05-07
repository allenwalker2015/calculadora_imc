import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddMinusCard extends StatelessWidget {
  final Function onMinusPressed, onPlusPressed;
  final String value, units, title;
  AddMinusCard(
      {this.title,
      this.value,
      this.units,
      this.onMinusPressed,
      this.onPlusPressed});
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: kLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                value,
                style: kNumberTextStyle,
              ),
              Text(
                units,
                style: kLabelTextStyle,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                onPressed: onMinusPressed,
                icon: FontAwesomeIcons.minus,
              ),
              SizedBox(
                width: 10,
              ),
              RoundIconButton(
                onPressed: onPlusPressed,
                icon: FontAwesomeIcons.plus,
              ),
            ],
          )
        ],
      ),
    );
  }
}
