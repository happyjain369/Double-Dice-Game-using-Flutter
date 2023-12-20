//import 'dart:ffi';
import 'dart:math';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);
  //if data comes from another page then all the variables, names and function will be here
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  //all function or variables of main.dart will be here

  int leftDiceNumber = 1;
  int rightDiceNumber = 6;
  int totalscore = 0;
  int flag = 0;

  int changeleftDiceFace() {
    //to update things we use setstate()
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
    return leftDiceNumber;
  }

  int changerightDiceFace() {
    //to update things we use setstate()
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
    return rightDiceNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 21, 29, 76),
      appBar: AppBar(
          title: Text('DiceApp'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 54, 54, 53)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 24, 24, 24),
              Color.fromARGB(255, 72, 69, 69)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  'Welcome.....!!!\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      //   changeleftDiceFace();
                    },
                    child: Image(
                      image: AssetImage('images/dice$leftDiceNumber.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      //   //changerightDiceFace();
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNumber.png'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    changeleftDiceFace();
                    changerightDiceFace();
                    //totalscore = totalscore + leftDiceNumber+rightDiceNumber;
                    if (rightDiceNumber == 6 || leftDiceNumber == 6) {
                      if (flag == 0) {
                        totalscore = leftDiceNumber + rightDiceNumber;
                      } else {
                        totalscore =
                            totalscore + leftDiceNumber + rightDiceNumber;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'You got one more chance\nYour Total scores - $totalscore'),
                          );
                        },
                      );
                      flag = 1;
                    } else {
                      if (flag == 0) {
                        totalscore = leftDiceNumber + rightDiceNumber;
                      } else {
                        totalscore =
                            totalscore + leftDiceNumber + rightDiceNumber;
                      }

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'Next Player\nYour Total scores - $totalscore'),
                          );
                        },
                      );
                      flag = 0;
                    }
                    ;
                  },
                  child: const Text(
                    "Roll the dice",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: const Text("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      //   changeleftDiceFace();
                    },
                    child: const Text(
                      "Read the policy",
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: const Text(
          'Visit Again...',
          style: TextStyle(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
        color: Colors.green,
      ),
    );
  }
}
