import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahyogii/khushi/constants.dart';
import 'package:sahyogii/khushi/icon_content.dart';
import 'package:sahyogii/khushi/reusable_card.dart';
import 'package:sahyogii/screens/location.dart';
import 'package:sahyogii/screens/signin_screen.dart';
import 'package:sahyogii/utils/color_utils.dart';
import 'package:sahyogii/vitals_sleep/pulse.dart';
import 'package:sahyogii/vitals_sleep/vitals_home.dart';

class HomeScreenCt extends StatefulWidget {
  const HomeScreenCt({super.key});

  @override
  State<HomeScreenCt> createState() => _HomeScreenCtState();
}

class _HomeScreenCtState extends State<HomeScreenCt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sahyogi - CareTaker'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("684AE"),
          hexStringToColor("79CBCA"),
          hexStringToColor("77A1D3")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PulseHome();
                  }));
                });
              },
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.fileWaveform,
                  label: 'Pulse Check',
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VitalHome();
                  }));
                });
              },
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.check,
                  label: 'Vitals Check',
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Location();
                  }));
                });
              },
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.locationArrow,
                  label: 'Find User Location',
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
