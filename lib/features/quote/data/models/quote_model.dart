import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 12:55.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

/// author : "Jamie Zawinski"
/// id : 32
/// quote : "Linux is only free if your time has no value."
/// permalink : "http://quotes.stormconsultancy.co.uk/quotes/32"

class QuoteModel extends Quote {
  QuoteModel({
    required String author,
    required int id,
    required String quote,
    required String permalink,
  }) : super(id: id, author: author, quote: quote, permalink: permalink);

  factory QuoteModel.fromJson(dynamic json) => QuoteModel(
      id: json["id"],
      author: json["author"],
      quote: json["quote"],
      permalink: json["permalink"]);
}

String? author;
int? id;
String? quote;
String? permalink;

Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  map['author'] = author;
  map['id'] = id;
  map['quote'] = quote;
  map['permalink'] = permalink;
  return map;
}
