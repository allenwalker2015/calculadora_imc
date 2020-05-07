import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String status;
  final String imc;
  final String recomendation;

  ResultsPage(
      {@required this.status,
      @required this.recomendation,
      @required this.imc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Tu resultado",
              style: kTitleStyle,
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(status.toUpperCase(), style: kResultsStyle),
                    Text(
                      imc.toString(),
                      style: kBMIStyle,
                    ),
                    Text(
                      recomendation,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Re-Calcular",
            )
          ],
        ),
      ),
    );
  }
}
