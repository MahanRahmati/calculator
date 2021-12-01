import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/helpers/functions.dart';
import '/models/history.dart';
import '/screens/history_page.dart';
import '/screens/info_page.dart';
import '/strings.dart';
import '/styles.dart';
import '/widgets/buttons.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> inputList = [];
  var answer = '0';
  var modeDeg = false; //TODO sin() and ... to deg (dart is using rad)
  var modeInverse = false;
  var afterEq = false;
  var dot = false;
  var op = false;

  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget numberButtonCreator(String string) => CalculatorButton(
          string: string,
          function: () {
            if (string == Strings.numbers[10]) {
              if (!dot) {
                dot = true;
                op = false;
                if (afterEq) {
                  inputList.removeRange(0, inputList.length);
                  answer = '0';
                  afterEq = false;
                  setState(() => inputList.add(string));
                } else {
                  setState(() => inputList.add(string));
                }
              }
            } else {
              op = false;
              if (afterEq) {
                inputList.removeRange(0, inputList.length);
                answer = '0';
                afterEq = false;
                setState(() => inputList.add(string));
              } else {
                setState(() => inputList.add(string));
              }
            }
          },
        );

    Widget functionButtonCreator(String string, String evString) =>
        FunctionButton(
          string: string,
          function: () {
            if (dot) dot = false;
            if (afterEq) {
              inputList.removeRange(0, inputList.length);
              answer = '0';
              afterEq = false;
              setState(() => inputList.add(evString));
            } else {
              setState(() => inputList.add(evString));
            }
          },
        );

    Widget simpleFunctionButtonCreator(String string, String evString) =>
        CalculatorButton(
          string: string,
          color: Styles.dividerColor,
          function: () {
            if (dot) dot = false;
            if (afterEq) {
              inputList.removeRange(0, inputList.length);
              answer = '0';
              afterEq = false;
              setState(() => inputList.add(evString));
            } else {
              setState(() => inputList.add(evString));
            }
          },
        );

    Widget stringButtonCreator(String string, String evString) =>
        CalculatorButton(
          string: string,
          color: Styles.secondaryColor1,
          function: () {
            if (!op) {
              op = true;
              if (dot) dot = false;
              if (afterEq) {
                afterEq = false;
                setState(() => inputList.add(evString));
              } else {
                setState(() => inputList.add(evString));
              }
            }
          },
        );

    final List<Widget> list = [
      (modeInverse)
          ? CalculatorButton(
              string: Strings.inverse,
              color: Styles.secondaryColor1,
              function: () => setState(() => modeInverse = !modeInverse),
            )
          : CalculatorButton(
              string: Strings.inverse,
              color: Styles.dividerColor,
              function: () => setState(() => modeInverse = !modeInverse),
            ),
      (modeDeg)
          ? CalculatorButton(
              string: Strings.deg,
              color: Styles.dividerColor,
              function: () => setState(() => modeDeg = !modeDeg),
            )
          : CalculatorButton(
              string: Strings.rad,
              color: Styles.dividerColor,
              function: () => setState(() => modeDeg = !modeDeg),
            ),
      (modeInverse) //TODO Mismatched parenthesis.
          ? functionButtonCreator(Strings.funArcSin, Strings.evArcSin)
          : functionButtonCreator(Strings.funSin, Strings.evSin),
      (modeInverse)
          ? functionButtonCreator(Strings.funArcCos, Strings.evArcCos)
          : functionButtonCreator(Strings.funCos, Strings.evCos),
      (modeInverse)
          ? functionButtonCreator(Strings.funArcTan, Strings.evArcTan)
          : functionButtonCreator(Strings.funTan, Strings.evTan),
      simpleFunctionButtonCreator(Strings.opPow, Strings.evPow),
      simpleFunctionButtonCreator(Strings.funLg, Strings.evLg),
      simpleFunctionButtonCreator(Strings.funLn, Strings.evLn),
      simpleFunctionButtonCreator(Strings.lParen, Strings.lParen),
      simpleFunctionButtonCreator(Strings.rParen, Strings.rParen),
      simpleFunctionButtonCreator(Strings.opSqrt, Strings.evSqrt),
      CalculatorButton(
        string: Strings.c,
        color: Styles.secondaryColor1,
        function: () => setState(() {
          inputList.removeRange(0, inputList.length);
          answer = '0';
          dot = false;
          op = false;
        }),
      ),
      DeleteButton(
        function: () {
          if (inputList.length == 1) {
            dot = false;
            op = false;
          }
          if (inputList.isNotEmpty) setState(() => inputList.removeLast());
        },
      ),
      stringButtonCreator(Strings.opPct, Strings.evPct), //TODO bug empty
      stringButtonCreator(Strings.opDiv, Strings.evDiv),
      simpleFunctionButtonCreator(Strings.opFact, Strings.evFact), //TODO
      numberButtonCreator(Strings.numbers[7]),
      numberButtonCreator(Strings.numbers[8]),
      numberButtonCreator(Strings.numbers[9]),
      stringButtonCreator(Strings.opMul, Strings.evMul),
      simpleFunctionButtonCreator(Strings.opAbs, Strings.evAbs),
      numberButtonCreator(Strings.numbers[4]),
      numberButtonCreator(Strings.numbers[5]),
      numberButtonCreator(Strings.numbers[6]),
      stringButtonCreator(Strings.opSub, Strings.opSub),
      simpleFunctionButtonCreator(Strings.constPi, Strings.evPi),
      numberButtonCreator(Strings.numbers[1]),
      numberButtonCreator(Strings.numbers[2]),
      numberButtonCreator(Strings.numbers[3]),
      stringButtonCreator(Strings.opAdd, Strings.opAdd),
      simpleFunctionButtonCreator(Strings.constE, Strings.evE),
      CalculatorButton(
        string: Strings.zeroZero,
        function: () {
          op = false;
          if (afterEq) {
            inputList.removeRange(0, inputList.length);
            answer = '0';
            afterEq = false;
            setState(() {
              inputList.add(Strings.numbers[0]);
              inputList.add(Strings.numbers[0]);
            });
          } else {
            setState(() {
              inputList.add(Strings.numbers[0]);
              inputList.add(Strings.numbers[0]);
            });
          }
        },
      ),
      numberButtonCreator(Strings.numbers[0]),
      numberButtonCreator(Strings.numbers[10]),
      EqualButton(
        function: () => setState(() {
          if (inputList.isNotEmpty) {
            if (inputList[0] == Strings.evDiv) {
              inputList.insert(0, Strings.numbers[0]);
            }
            if (inputList[0] == Strings.opMul) {
              inputList.insert(0, Strings.numbers[0]);
            }
            if (inputList[0] == Strings.evPow) {
              inputList.insert(0, Strings.numbers[0]);
            }
            if (inputList[0] == Strings.numbers[10]) {
              inputList.insert(0, Strings.numbers[0]);
            }
            answer = evaluate(inputList);
            Provider.of<HistoryList>(context, listen: false).addHistory(
              stringMaker(inputList),
              answer,
            );
            inputList.removeRange(0, inputList.length);
            inputList.add(answer);
            afterEq = true;
            dot = false;
            op = false;
          }
        }),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        leading: IconButton(
          icon: const Icon(Icons.info_outlined),
          onPressed: () => Navigator.of(context).pushNamed(
            InfoPage.routeName,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_outlined),
            onPressed: () => Navigator.of(context).pushNamed(
              HistoryPage.routeName,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  //TODO Remove this
                  padding: Styles.ltrb,
                  alignment: Alignment.centerRight,
                  child: Text(inputList.toString()),
                ),
                Container(
                  padding: Styles.ltrb,
                  alignment: Alignment.centerRight,
                  child: Text(stringMaker(inputList)),
                ),
                Container(
                  padding: Styles.ltrb,
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Styles.padding),
            child: Divider(),
          ),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1.2,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            children: list,
          ),
        ],
      ),
    );
  }
}
