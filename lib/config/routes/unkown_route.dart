import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/19/2022 at 08:29.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Unknown Route'),
    ));
  }
}
