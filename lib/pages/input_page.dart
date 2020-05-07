import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/add_minus_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectHeight = 180;
  int weight = 120;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: GenderCard(
                  onPress: () {
                    print("El hombre ha sido seleccionado");
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  icon: Icon(
                    FontAwesomeIcons.mars,
                    size: 80,
                  ),
                  label: "Hombre",
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                ),
              ),
              Expanded(
                child: GenderCard(
                  onPress: () {
                    print("La mujer ha sido seleccionado");
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  icon: Icon(
                    FontAwesomeIcons.venus,
                    size: 80,
                  ),
                  label: "Mujer",
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            color: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Altura",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text('$selectHeight', style: kNumberTextStyle),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      thumbColor: Color(0xFFEB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    value: selectHeight.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        selectHeight = newValue.toInt();
                        print(newValue);
                      });
                    },
                    min: 120,
                    max: 250,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: AddMinusCard(
                  title: "Peso",
                  value: weight.toString(),
                  units: "lbs",
                  onMinusPressed: () {
                    setState(() {
                      if (weight > 1) {
                        weight--;
                      }
                    });
                  },
                  onPlusPressed: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
              ),
              Expanded(
                child: AddMinusCard(
                  title: "Edad",
                  value: age.toString(),
                  units: "años",
                  onMinusPressed: () {
                    setState(() {
                      if (age > 1) {
                        age--;
                      }
                    });
                  },
                  onPlusPressed: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          onPressed: () {
            CalculatorBrain imc =
                CalculatorBrain(weight: weight, height: selectHeight);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          imc: imc.calculate(),
                          recomendation: imc.getInterpretation(),
                          status: imc.getResult(),
                        )));
          },
          text: "Calcular",
        )
      ]),
    );
  }
}
