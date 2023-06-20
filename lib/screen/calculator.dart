import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                // Container(
                //   padding: EdgeInsets.all(10.0),
                //   alignment: Alignment.bottomRight,
                //   child: Text(
                //     result,
                //     style: TextStyle(
                //         fontSize: 60.0,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.deepOrange),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userInput,
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              customOutlineButton("9"),
              customOutlineButton("8"),
              customOutlineButton("7"),
              customOutlineButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              customOutlineButton("6"),
              customOutlineButton("5"),
              customOutlineButton("4"),
              customOutlineButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customOutlineButton("3"),
              customOutlineButton("2"),
              customOutlineButton("1"),
              customOutlineButton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              customOutlineButton("C"),
              customOutlineButton("0"),
              customOutlineButton("="),
              customOutlineButton("/"),
            ],
          ),
        ],
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlinedButton(
        // padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 35.0, color: Colors.deepOrange),
        ),
      ),
    );
  }

  int first = 0;
  int second = 0;
  String result = "0";
  String? opp;
  String userInput = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      result = "0";
      userInput = "";
      first = 0;
      second = 0;
    }
    setState(() {});
    userInput = userInput + btnText;
  }
}


//  else if (btnText == "+" ||
//         btnText == "-" ||
//         btnText == "x" ||
//         btnText == "/") {
//       first = int.parse(userInput);
//       result = "";
//       opp = btnText;
//     } else if (btnText == "=") {
//       second = int.parse(userInput);
//       if (opp == "+") {
//         result = (first + second).toString();
//       }
//       if (opp == "-") {
//         result = (first - second).toString();
//       }
//       if (opp == "x") {
//         result = (first * second).toString();
//       }
//       if (opp == "/") {
//         result = (first ~/ second).toString();
//       }
//     } else {
//       result = int.parse(userInput + btnText).toString();
//     }
//     setState(() {
//       userInput = result;
//     });
