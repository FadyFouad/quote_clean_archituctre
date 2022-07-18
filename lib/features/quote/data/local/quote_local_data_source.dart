import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/features/quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 13:14.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class GetQuoteLocalDataSource {
  Future<Either<Failure, QuoteModel>> getRandomQuote();

  Future<bool> cacheQuote();
}

class GetQuoteLocalDataSourceImpl implements GetQuoteLocalDataSource {
  @override
  Future<Either<Failure, QuoteModel>> getRandomQuote() async {
    return Right(QuoteModel(
        id: 2,
        quote: 'Linux is only free if your time has no value."',
        author: 'Jamie Zawinski',
        permalink: 'link'));
  }

  @override
  Future<bool> cacheQuote() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(
        'quote', 'Linux is only free if your time has no value."');
  }
}