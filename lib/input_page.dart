import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'IconContent.dart';
import 'constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'result.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
// Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  // //1=male,2=female
  // void updateColor(Gender selectedgender) {
  //   if (selectedgender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else
  //       maleCardColor = inactiveCardColor;
  //   }
  //   if (selectedgender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else
  //       femaleCardColor = inactiveCardColor;
  //   }
  // }
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 15;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      flag = true;
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    onPress: () {
                      flag = true;
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xffeb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 200,
                      label: '100',
                      activeColor: Color(0xffeb1555),
                      inactiveColor: Color(0xff8d8e98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            ' Kg',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                weight = weight + 10;
                              });
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                if (weight >= 10) {
                                  weight = weight - 10;
                                } else
                                  Fluttertoast.showToast(
                                      msg: "Weight can't be Negative  ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                              });
                            },
                            child: RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight >= 1) {
                                    weight--;
                                  } else
                                    Fluttertoast.showToast(
                                        msg: "Weight can't be Negative  ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: kactiveCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            ' Yrs',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                age = age + 10;
                              });
                            },
                            child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                if (age >= 10) {
                                  age = age - 10;
                                } else
                                  Fluttertoast.showToast(
                                      msg: "Weight can't be Negative  ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                              });
                            },
                            child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age >= 1) {
                                      age = age - 1;
                                    } else
                                      Fluttertoast.showToast(
                                          msg: "Age can't be Negative  ",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                  });
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: kactiveCardColor,
                )),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              if (flag == false) {
                Fluttertoast.showToast(
                    msg: "Please select a Gender",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 21.0);
              } else {
                calculator cal = calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmiResult: cal.calculateBMI(),
                      resultText: cal.getResult(),
                      interpretation: cal.getInterpretation(),
                    ),
                  ),
                );
              }
            },
            butttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.butttonTitle});

  final Function onTap;
  final String butttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContaieerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kbottomContainerColor,
        ),
        child: Center(
          child: Text(
            butttonTitle,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
