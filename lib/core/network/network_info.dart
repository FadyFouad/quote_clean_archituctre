import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 13:10.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}