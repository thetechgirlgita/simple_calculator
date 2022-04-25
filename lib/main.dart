import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CalcButton.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key ?key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color:  Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    fillColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    fillColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    fillColor: 0xFFFFFFFF,
                    text: '9',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                      fillColor: 0xFFFFFFFF,
                  ),
                  CalcButton(
                    text: '5',
                    fillColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                      fillColor: 0xFFFFFFFF,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick, fillColor: 0xFFFFFFFF,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick, fillColor: 0xFFFFFFFF,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                      fillColor: 0xFFFFFFFF,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    fillColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    fillColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '00',
                    callback: numClick,
                    fillColor: 0xFFFFFFFF,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFF4,
                    textColor: 0xFF659DAC,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}