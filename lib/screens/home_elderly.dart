import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahyogii/khushi/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahyogii/khushi/icon_content.dart';
import 'package:sahyogii/khushi/reusable_card.dart';
import 'package:sahyogii/khushi/constants.dart';
import 'package:sahyogii/screens/med_home.dart';
import 'package:sahyogii/utils/color_utils.dart';
import 'package:sahyogii/vitals_sleep/pulse.dart';
import 'package:sahyogii/vitals_sleep/sleep_home.dart';
import 'package:sahyogii/vitals_sleep/vitals_home.dart';

enum Gender {
  male,
  female,
}

class HomeScreenEld extends StatefulWidget {
  const HomeScreenEld({super.key});

  @override
  State<HomeScreenEld> createState() => _HomeScreenEldState();
}

class _HomeScreenEldState extends State<HomeScreenEld> {
  Gender? selectedGender;
  int height = 180;
  int weight = 40;
  int age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sahyogi-Elderly'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("684AE"),
              hexStringToColor("79CBCA"),
              hexStringToColor("77A1D3")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PulseHome();
                          }));
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.notesMedical,
                          label: 'Pulse Check',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MedHome();
                          }));
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.tablets,
                          label: 'Medicine Tracker',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VitalHome();
                          }));
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.check,
                          label: 'Vitals',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SleepHome();
                          }));
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.bedPulse,
                          label: 'Sleep Tracker',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Additional Horizontal Card

            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InputPage();
                  }));
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Add desired padding
                child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? activeCardColour
                      : inactiveCardColour,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Add desired padding inside the card
                    child: IconContent(
                      icon: FontAwesomeIcons.calculator,
                      label: 'BMI Calculator',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            // border:
            //     Border.all(color: Colors.black), // Add boundary with red color
            // shape: BoxShape.circle, // Ensure the container is circular
            ),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(
              255, 217, 240, 239), // Set background color transparent
          foregroundColor: Colors.red, // Set icon color red
          onPressed: () {
            // Add your onPressed logic here
          },
          child: const Icon(FontAwesomeIcons.triangleExclamation),
        ),
      ),
    );
  }
}
