import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 13:07.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
