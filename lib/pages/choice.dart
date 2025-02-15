import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _choiceState();
}

class _choiceState extends State<Choice> {
  dynamic TextColor = Colors.white;
  dynamic butonSize = 17.0;
  dynamic headSize = 26.0;
  dynamic conSize = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Text('FITNESS',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 32, 106, 167),
                            fontSize: 26.0,
                            fontWeight: FontWeight.w900,
                          )),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text('TRACKER',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 62, 110, 40),
                            fontSize: 26.0,
                            fontWeight: FontWeight.w900,
                          )),
                    ],
                  )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/workout');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: const Color.fromARGB(255, 88, 180, 255),
                  maximumSize: Size(200, 200),
                  minimumSize:
                      Size(200, 200), // Width fills parent, height is 70
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Adjust corner radius if needed
                  ),
                ),
                child: Text(
                  'WORKOUTS',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 252, 252),
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calories');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: const Color.fromARGB(255, 62, 110, 40),
                  maximumSize: Size(200.0, 200.0),
                  minimumSize:
                      Size(200.0, 200.0), // Width fills parent, height is 70
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Adjust corner radius if needed
                  ),
                ),
                child: Text(
                  'CALORIES',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 254, 254),
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
