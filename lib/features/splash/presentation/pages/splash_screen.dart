import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quote_clean_archituctre/config/routes/app_routes.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/19/2022 at 08:31.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.quote);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(AppLocalizations.of(context)!.helloWorld),
    ));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
