import 'package:flutter/material.dart';
import 'package:quote_clean_archituctre/config/routes/unkown_route.dart';
import 'package:quote_clean_archituctre/features/quote/presentation/pages/quote_screen.dart';
import 'package:quote_clean_archituctre/features/splash/presentation/pages/splash_screen.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/19/2022 at 08:26.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class Routes {
  static const String root = '/';
  static const String quote = '/quote';
  static const String quoteDetail = '/quote/detail';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.quote:
        return MaterialPageRoute(builder: (context) => const QuoteScreen());
      default:
        return MaterialPageRoute(builder: (context) => const UnknownRoute());
    }
  }
}
