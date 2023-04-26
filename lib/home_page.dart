import 'package:flutter/material.dart';
import 'dart:math';

// import 'package:hive/hive.dart';

// Create a Form widget.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class HomePageState extends State<HomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<HomePageState>.

  late final Box box;

  final List<String> names = <String>[
    'Aby',
    'Aish',
    'Ayan',
    'Ben',
    'Bob',
    'Charlie',
    'Cook',
    'Carline'
  ];
  final List<int> msgCount = <int>[2, 0, 10, 6, 52, 4, 0, 2, 12, 31];
  final _commentTextController = TextEditingController();
  Random random = Random();

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    // box = Hive.box('categories');
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    _commentTextController.dispose();
    // Hive.close();
  }

  void addItemToList() {
    setState(() {
      names.insert(0, _commentTextController.text);
      int randomNumber = random.nextInt(100);
      msgCount.insert(0, randomNumber);
      _commentTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _commentTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your comment',
            ),
          ),
        ),
        ElevatedButton(
          child: const Text("Enter"),
          onPressed: () {
            addItemToList();
          },
        ),
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                margin: const EdgeInsets.all(2),
                color: msgCount[index] >= 10
                    ? Colors.blue[400]
                    : msgCount[index] > 3
                        ? Colors.blue[100]
                        : Colors.grey,
                child: Center(
                  child: Text(
                    '${names[index]} (${msgCount[index]})',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
