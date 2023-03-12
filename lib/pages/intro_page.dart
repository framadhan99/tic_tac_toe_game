import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/styles.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBlueGrey,
      body: Center(
          child: Text(
        'Tic-Tac-Toe Game',
        style: Styles.textPriamry,
      )),
    );
  }
}
