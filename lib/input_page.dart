import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
 int height = 180;
 int weight = 60;
 int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  },);
                },
                colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                cardChild: IconContent(
                    icon: FontAwesomeIcons.mars, label: 'MALE'),
              )),
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                cardChild:
                IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
              )),
            ],
          ),),
          Expanded(child: ReusableCard(
              colour: kActiveCardColour,
                  cardChild: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text('HEIGHT', style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text('cm', style: kLabelTextStyle,),

                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Colors.red,
                          // Color(0xFFB1555),
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max:  220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });

                          },),
                      ),
                    ],
                  ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                            onPressed: () {
                                setState(() {
                                  weight--;
                                });
                            },
                          ),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  )),
              Expanded(child:  ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            titleText: 'CALCULATE',
             onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => ResultsPage(
      bmiResult: calc.calculateBMI() ,
      resultText: calc.getResult(),
      interpretationText: calc.getInterpretation(),
    )));
    },
          ),
        ],

      ),

    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, this.titleText});

  final Function onTap;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            titleText,
            style: kLargeButtonTextStyle
          ),
        ),
        color: Colors.red,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
