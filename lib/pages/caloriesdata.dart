import 'package:flutter/material.dart';

class CaloriesPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<CaloriesPage> {
  List<Map<String, String>> workoutData = [];
  Set<String> uniqueDates = {}; 
  int totalDays = 10; 
  double progress = 0.0;

  TextEditingController dateController = TextEditingController();
  TextEditingController workoutController = TextEditingController();
  TextEditingController setsController = TextEditingController();
  TextEditingController daysController = TextEditingController();

 
  void _updateProgress() {
    setState(() {
      progress = uniqueDates.length / totalDays;
    });
  }

  
  void _showAddWorkoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add food Consumed",
            style: TextStyle(
                color: const Color.fromARGB(255, 1, 39, 13),
                fontSize: 25.0,
                fontWeight: FontWeight.w700)),
        content: Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)),
                  focusColor: const Color.fromARGB(255, 12, 53, 2),
                  labelText: "Date (YYYY-MM-DD)",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 1, 39, 13),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700)),
              controller: dateController,
            ),
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)),
                  focusColor: const Color.fromARGB(255, 1, 39, 13),
                  labelText: "food taken",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 1, 39, 13),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700)),
              controller: workoutController,
            ),
            TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23)),
                  focusColor: const Color.fromARGB(255, 2, 51, 28),
                  labelText: "Sets",
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 1, 39, 13),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700)),
              controller: setsController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",
                style: TextStyle(
                    color: const Color.fromARGB(255, 1, 39, 13),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
               
                workoutData.add({
                  "date": dateController.text,
                  "food": workoutController.text,
                  "calories": setsController.text,
                });

               
                if (!uniqueDates.contains(dateController.text)) {
                  uniqueDates.add(dateController.text);
                }

                // Clear input fields
                dateController.clear();
                workoutController.clear();
                setsController.clear();

               
                _updateProgress();
              });
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

 
  void _showSetDaysDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Set Days to track",
            style: TextStyle(
                color: const Color.fromARGB(255, 1, 39, 13),
                fontSize: 25.0,
                fontWeight: FontWeight.w700)),
        content: TextField(
          controller: daysController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              fillColor: Colors.white,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
              focusColor: const Color.fromARGB(255, 11, 46, 2),
              labelText: "Total Days",
              labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 1, 39, 13),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",
                style: TextStyle(
                    color: const Color.fromARGB(255, 1, 39, 13),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                totalDays = int.tryParse(daysController.text) ?? 10;
                progress =
                    uniqueDates.length / totalDays;
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 4,
              backgroundColor: const Color.fromARGB(255, 94, 248, 107),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(2), 
              ),
            ),
            child: Text("Set",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 252, 252),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Progress",
            style: TextStyle(
                color: const Color.fromARGB(255, 225, 230, 236),
                fontSize: 25.0,
                fontWeight: FontWeight.w700)),
        backgroundColor: const Color.fromARGB(255, 62, 110, 40),
        actions: [
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            onPressed: _showSetDaysDialog, 
          )
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Workout Progress (${uniqueDates.length} / $totalDays Days)",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 13, 109, 34),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  color: const Color.fromARGB(255, 43, 152, 255),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _showAddWorkoutDialog,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 13, 109, 34)),
                  child: Text("Add Workout",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
         
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text("Date",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 1, 38, 68),
                              fontWeight: FontWeight.w300))),
                  DataColumn(
                      label: Text("food",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 1, 38, 68),
                              fontWeight: FontWeight.w300))),
                  DataColumn(
                      label: Text("calories",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 1, 38, 68),
                              fontWeight: FontWeight.w300))),
                ],
                rows: workoutData
                    .map(
                      (entry) => DataRow(
                        cells: [
                          DataCell(Text(entry["date"]!)),
                          DataCell(Text(entry["food"]!)),
                          DataCell(Text(entry["calories"]!)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
