import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 12:54.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

/// author : "Jamie Zawinski"
/// id : 32
/// quote : "Linux is only free if your time has no value."
/// permalink : "http://quotes.stormconsultancy.co.uk/quotes/32"

class Quote {
  Quote({
    required this.author,
    required this.id,
    required this.quote,
    required this.permalink,});

  String author;
  int id;
  String quote;
  String permalink;
}