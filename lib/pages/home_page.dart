import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/main.dart';
import 'package:tic_tac_toe_game/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTrun = true;
  List<String> displayOX = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];
  int attempts = 0;

  int oScore = 0;
  int xScore = 0;
  int filledBoxs = 0;
  String resultDeclaration = '';
  bool winnerFound = false;

  static const maxSecond = 30;
  int second = maxSecond;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (second > 0) {
          second--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => second = maxSecond;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBlueGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Player O',
                          style: Styles.textPriamry,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          oScore.toString(),
                          style: Styles.textPriamry,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Player X',
                          style: Styles.textPriamry,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          xScore.toString(),
                          style: Styles.textPriamry,
                        ),
                      ],
                    )
                  ],
                )),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: matchedIndexes.contains(index)
                                ? Styles.colorGreen
                                : Styles.colorWhite,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: Styles.colorBlueGrey)),
                        child: Center(
                            child: Text(
                          displayOX[index],
                          style: Styles.textPriamry
                              .copyWith(color: Styles.colorBlue, fontSize: 70),
                        )),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const SizedBox(height: 30),
                    Text(
                      resultDeclaration,
                      style: Styles.textPriamry,
                    ),
                    // const SizedBox(height: 40),
                    _buildTimer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // tapped tic tac toe
  void _tapped(int index) {
    final isRuning = timer == null ? false : timer!.isActive;

    if (isRuning) {
      setState(() {
        if (oTrun && displayOX[index] == '') {
          displayOX[index] = 'O';
          filledBoxs++;
        } else if (!oTrun && displayOX[index] == '') {
          displayOX[index] = 'X';
          filledBoxs++;
        }

        oTrun = !oTrun;
        _checkWinner();
      });
    }
  }

  // check winner
  void _checkWinner() {
    // check 1st row
    if (displayOX[0] == displayOX[1] &&
        displayOX[0] == displayOX[2] &&
        displayOX[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[0] + ' Wins!';
        matchedIndexes.addAll([0, 1, 2]);
        stopTimer();
        _updateWin(displayOX[0]);
      });
    }

    // check 2nd row
    if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[3] + ' Wins!';
        matchedIndexes.addAll([3, 4, 5]);
        stopTimer();
        _updateWin(displayOX[3]);
      });
    }

    // check 3rd row
    if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[6] + ' Wins!';
        matchedIndexes.addAll([6, 7, 8]);
        stopTimer();
        _updateWin(displayOX[6]);
      });
    }

    // check 1st column
    if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[0] + ' Wins!';
        matchedIndexes.addAll([0, 3, 6]);
        stopTimer();
        _updateWin(displayOX[0]);
      });
    }

    // check 2nd Column
    if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[1] + ' Wins!';
        matchedIndexes.addAll([1, 4, 7]);
        stopTimer();
        _updateWin(displayOX[1]);
      });
    }

    // check 3rd column
    if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[2] + ' Wins!';
        matchedIndexes.addAll([2, 5, 8]);
        stopTimer();
        _updateWin(displayOX[2]);
      });
    }

    // check diagonal
    if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[0] + ' Wins!';
        matchedIndexes.addAll([0, 4, 8]);
        stopTimer();
        _updateWin(displayOX[0]);
      });
    }

    // check diagonal
    if (displayOX[6] == displayOX[4] &&
        displayOX[6] == displayOX[2] &&
        displayOX[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayOX[6] + ' Wins!';
        matchedIndexes.addAll([6, 4, 2]);
        stopTimer();
        _updateWin(displayOX[6]);
      });
    }

    // check nobody winner
    if (!winnerFound && filledBoxs == 9) {
      setState(() {
        resultDeclaration = 'Nobody Wins!';
      });
    }
  }

  // update winner
  void _updateWin(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  // clear Board
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayOX[i] = '';
      }
      resultDeclaration = '';
    });
    filledBoxs = 0;
    matchedIndexes = [];
  }

  Widget _buildTimer() {
    final isRuning = timer == null ? false : timer!.isActive;

    return isRuning
        ? SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - second / maxSecond,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: Styles.colorGreen,
                ),
                Center(
                    child: Text(
                  second.toString(),
                  style: Styles.textPriamry,
                ))
              ],
            ),
          )
        : MaterialButton(
            onPressed: () {
              startTimer();
              _clearBoard();
              attempts++;
            },
            color: Styles.colorGreen,
            child: Text(
              attempts == 0 ? 'Start Game' : 'Play Again!',
              style: Styles.textPriamry.copyWith(
                  fontSize: 18, fontFamily: '', fontWeight: FontWeight.w600),
            ),
          );
  }
}
