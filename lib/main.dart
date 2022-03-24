import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const calculator());
}

// ignore: camel_case_types
class calculator extends StatefulWidget {
  const calculator({Key ?key}) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

// ignore: camel_case_types
class _calculatorState extends State<calculator> {
  @override
  Widget build(BuildContext context) {
   return const MaterialApp(home: homeScreen(),);
  }
}
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculator",
          style:  TextStyle(
            fontSize: 20,

          )
        )


      ),
    );

  }
}



