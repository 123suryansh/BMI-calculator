import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'constants.dart';
import 'resultsPage.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum GenderType{
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  GenderType selectedGender;
  int height=180;
  int weight=60;
  int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),  // Color maleCardColor=inactiveCardColor;
      // Color femaleCardColor=inactiveCardColor;
      //
      // void updateColor(genderType label){
      //   if (label==genderType.Male){
      //     if (maleCardColor==inactiveCardColor){
      //       maleCardColor=activeCardColor;
      //       femaleCardColor=inactiveCardColor;
      //     }
      //     else{
      //       maleCardColor=inactiveCardColor;
      //   }
      //
      //   }
      //   if (label==genderType.Female){
      //     if (femaleCardColor==inactiveCardColor){
      //       femaleCardColor=activeCardColor;
      //       maleCardColor=inactiveCardColor;
      //     }
      //     else{
      //       femaleCardColor=inactiveCardColor;
      //     }
      //   }
      //
      // }
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
        Expanded(
          child: Row(
          children:<Widget> [
            Expanded(
            child:ReusableCard(
              onPress: (){
                setState(() {
                  selectedGender=GenderType.Male;
                });
              },
              colour:selectedGender==GenderType.Male ? activeCardColor:inactiveCardColor,
                cardChild:IconContent(icon:FontAwesomeIcons.mars, gender:'MALE'),
            ),
            ),
            Expanded(
              child:ReusableCard(
                onPress:(){
                  setState(() {
                    selectedGender=GenderType.Female;
                  });
                },
                colour: selectedGender==GenderType.Female ? activeCardColor : inactiveCardColor,
                cardChild:IconContent(icon:FontAwesomeIcons.venus, gender:'FEMALE'),
              ),
            ),
          ],
        ),
        ),
        Expanded(
          child:ReusableCard(
            colour:activeCardColor,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Text(
                  'HEIGHT',
                  style:labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:<Widget>[
                    Text(
                      height.toString(),
                      style:heightTextStyle,
                    ),
                    Text(
                      'cm',
                      style:labelTextStyle,
                    ),
                  ],
                ),

                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      inactiveTrackColor:Color(0XFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0XFFEB1555),
                      overlayColor:Color(0X29EB1555),
                      thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                    value:height.toDouble(),
                    min:120.0,
                    max:220.0,

                    onChanged:(double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    }
                ),
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          child:Row(
          children:<Widget> [
            Expanded(
              child:ReusableCard(
                colour:activeCardColor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                      'WEIGHT',
                      style:labelTextStyle
                    ),
                    Text(
                      weight.toString(),
                      style:heightTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        RoundIconButton(
                          icon:FontAwesomeIcons.minus,
                          onPress:(){
                            setState(() {
                              weight--;
                            });
                          }
                        ),
                        SizedBox(
                          width:10.0,
                        ),
                        RoundIconButton(
                          icon:FontAwesomeIcons.plus,
                          onPress:(){
                            setState(() {
                              weight++;
                            });
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child:ReusableCard(
                colour:activeCardColor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text(
                        'AGE',
                        style:labelTextStyle
                    ),
                    Text(
                      age.toString(),
                      style:heightTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                            onPress:(){
                              setState(() {
                                age--;
                              });
                            }
                        ),
                        SizedBox(
                          width:10.0,
                        ),
                        RoundIconButton(
                            icon:FontAwesomeIcons.plus,
                            onPress:(){
                              setState(() {
                                age++;
                              });
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    ),
          BottomButton(buttonTitle:'CALCULATE', onTap:(){
            CalculatorBrain calc=CalculatorBrain(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Results(
              bmiResult: calc.calculateBmi(),
              interpretation: calc.getInterpretation(),
              resultText:calc.getResult(),
            ),),);
          },
          ),
    ],
      ),
      );
  }
}








