import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/core/network/api/api_consumer.dart';
import 'package:quote_clean_archituctre/core/network/api/end_points.dart';
import 'package:quote_clean_archituctre/features/quote/data/models/quote_model.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 13:15.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class GetQuoteRemoteDataSource {
  Future<Either<Failure, QuoteModel>> getRandomQuote();
}

class GetQuoteRemoteDataSourceImpl extends GetQuoteRemoteDataSource {
  ApiConsumer apiConsumer;

  GetQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, QuoteModel>> getRandomQuote() async {
    try {
      var res = await apiConsumer.get(quotesUrl);
      print(res);
      return Right(QuoteModel.fromJson(res));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}