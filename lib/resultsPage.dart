import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bottom_button.dart';
import 'constants.dart';


class Results extends StatelessWidget {
  Results({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Center(
            child: Text(
                'BMI CALCULATOR'
            ),
          ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget>[
          Expanded(
            child:Container(
              padding:EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child:Text(
                'Your Result',
                style:titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex:5,
            child:ReusableCard(
              colour:activeCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style:resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style:bmiTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style:bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap:(){
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
