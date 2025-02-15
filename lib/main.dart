import 'package:flutter/material.dart';
import 'package:gymtracker/pages/Workout.dart';
import 'package:gymtracker/pages/calories.dart';
import 'package:gymtracker/pages/caloriesdata.dart';
import 'package:gymtracker/pages/choice.dart';
import 'package:gymtracker/pages/create.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/workout': (context) => Workout(),
      '/calories': (context) => Calories(),
      '/home': (context) => Choice(),
      '/caloriesPage': (context) => CaloriesPage(),
      '/workoutdata': (context) => ProgressPage(),
    },
    home: Choice(),
  ));
}
