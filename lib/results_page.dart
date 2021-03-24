import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,this.resultText,this.interpretationText});

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text( 'BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
         Expanded(
             flex : 5,
             child: ReusableCard(
             colour: kActiveCardColour,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,

                 children: <Widget>[
                   Text(resultText.toUpperCase(),
                     style: kResultTextStyle,
                   ),
                   Text (
                     bmiResult,
                     style: kBMITextStyle,
                   ),
                   Text(
                     interpretationText,
                     style: kBodyTextStyle,
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),

         )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                    'RE-CALCULATE',
                    style: kLargeButtonTextStyle
                ),
              ),
              color: Colors.red,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 15.0),
              height: kBottomContainerHeight,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );

  }
}
