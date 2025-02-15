import 'package:flutter/material.dart';

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _choiceState();
}

class _choiceState extends State<Calories> {
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
                      Text('CALORIES TRACK',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 62, 110, 40),
                            fontSize: 26.0,
                            fontWeight: FontWeight.w900,
                          )),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text('',
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
                  Navigator.popAndPushNamed(context, '/caloriesPage');
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
                  'CONTINUE',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 253, 253, 253),
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: const Color.fromARGB(255, 62, 110, 40),
                  minimumSize: Size(200, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 253, 253, 253),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
