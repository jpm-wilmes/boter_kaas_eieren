import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boter, Kaas, Eieren',
      home: MyHomePage(title: 'Boter, Kaas, Eieren'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Global definition for playboard.

  bool turn = false; // alternating X or O

  var playBoard =
      List.generate(3, (i) => List(3), growable: false); // fixed board array
  bool win = false;

  void initState(){ // contructing the board (first time)
    clearBoard();
  }

  void clearBoard() {
    for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 3; y++) {
        playBoard[x][y] = 0;
      }
    }
    win = false;
  }

  Icon _correctIcon(int x, y) {
    // define the correct icon based on the user and old state

    Icon presentIcon; // store the result in present for later return
    if (playBoard[x][y] == 1) {
      // no value set yet. Only then modification allowed
      presentIcon = Icon(Icons.trip_origin, color: Colors.red, size: 100); // O
    } else if (playBoard[x][y] == 2) {
      presentIcon = Icon(Icons.close, color: Colors.green, size: 100); // X

    } else if (playBoard[x][y] == 0) {

      presentIcon = Icon(Icons.blur_on, color: Colors.grey[100], size: 100);
    }
    return presentIcon;
  }

  bool _checkWin(turn) {
    // for winning check: check 3 rows, check 3 columns and check 2 diagonals
    int checkValue;
    bool won = false;
    turn ? checkValue = 1 : checkValue = 2; // determine to check X or O
    // check rows

    if ((playBoard[0][0] == checkValue) &
        (playBoard[0][1] == checkValue) &
        (playBoard[0][2] == checkValue)) {
      won = true;
    }
    if ((playBoard[1][0] == checkValue) &
        (playBoard[1][1] == checkValue) &
        (playBoard[1][2] == checkValue)) {
      won = true;
    }
    if ((playBoard[2][0] == checkValue) &
        (playBoard[2][1] == checkValue) &
        (playBoard[2][2] == checkValue)) {
      won = true;
    }
    // check columns
    if ((playBoard[0][0] == checkValue) &
        (playBoard[1][0] == checkValue) &
        (playBoard[2][0] == checkValue)) {
      won = true;
    }
    if ((playBoard[0][1] == checkValue) &
        (playBoard[1][1] == checkValue) &
        (playBoard[2][1] == checkValue)) {
      won = true;
    }
    if ((playBoard[0][2] == checkValue) &
        (playBoard[1][2] == checkValue) &
        (playBoard[2][2] == checkValue)) {
      won = true;
    }
    // check diagonals
    if ((playBoard[0][0] == checkValue) &
        (playBoard[1][1] == checkValue) &
        (playBoard[2][2] == checkValue)) {
      won = true;
    }
    if ((playBoard[2][0] == checkValue) &
        (playBoard[1][1] == checkValue) &
        (playBoard[0][2] == checkValue)) {
      won = true;
    }
    return won;
  }

  void _correctState(int x, y) {
    if (playBoard[x][y] == 0) {
      // only
      if (turn) {
        playBoard[x][y] = 1;
      } else {
        playBoard[x][y] = 2;
      }
      // now check if there's a winner. turn=value 1, !turn=value 2
      win = _checkWin(turn); // get winner status. If true, game won.

      turn = !turn; // change turn (x->o->x....)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(0, 0);
                    });
                  },
                  child: _correctIcon(0, 0),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(0, 1);
                    });
                  },
                  child: _correctIcon(0, 1),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(0, 2);
                    });
                  },
                  child: _correctIcon(0, 2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(1, 0);
                    });
                  },
                  child: _correctIcon(1, 0),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(1, 1);
                    });
                  },
                  child: _correctIcon(1, 1),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(1, 2);
                    });
                  },
                  child: _correctIcon(1, 2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(2, 0);
                    });
                  },
                  child: _correctIcon(2, 0),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(2, 1);
                    });
                  },
                  child: _correctIcon(2, 1),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      _correctState(2, 2);
                    });
                  },
                  child: _correctIcon(2, 2),
                ),
              ],
            ),
            Divider(color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text((win ? "Gewonnen " + (turn ? "X" : "O").toString() :"").toString()  ),
                      FlatButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {

                          setState(() {
                            clearBoard(); // reset playBoard matrix to 0

                          });
                        },
                        child:
                            Icon(Icons.autorenew, color: Colors.red, size: 100),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
