import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tic_tac_toe_game/pages/home_page.dart';

import '../utils/styles.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  Future nextPage() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBlueGrey,
      body: Center(
          child: Text(
        'Tic-Tac-Toe Game',
        style: Styles.textPriamry.copyWith(fontSize: 32),
      )),
    );
  }
}
