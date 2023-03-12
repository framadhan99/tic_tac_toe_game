import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTrun = true;
  List<String> displayOX = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBlueGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: Text('Score Board')),
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
                            color: Styles.colorWhite,
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
                flex: 1,
                child: Text('Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // tapped tic tac toe
  void _tapped(int index) {
    setState(() {
      if (oTrun && displayOX[index] == '') {
        displayOX[index] = 'O';
      } else {
        displayOX[index] = 'X';
      }

      oTrun = !oTrun;
    });
  }
}
