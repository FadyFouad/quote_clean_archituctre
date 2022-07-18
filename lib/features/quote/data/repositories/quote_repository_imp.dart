import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/core/network/network_info.dart';
import 'package:quote_clean_archituctre/features/quote/data/local/quote_local_data_source.dart';
import 'package:quote_clean_archituctre/features/quote/data/remote/quote_remote_data_source.dart';
import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';
import 'package:quote_clean_archituctre/features/quote/domain/repositories/quote_repository.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 13:09.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class QuoteRepositoryImp implements QuoteRepository {
  final NetworkInfo networkInfo;
  final GetQuoteLocalDataSource getQuoteLocalDataSource;
  final GetQuoteRemoteDataSource getQuoteRemoteDataSource;

  QuoteRepositoryImp(
      {required this.networkInfo,
      required this.getQuoteLocalDataSource,
      required this.getQuoteRemoteDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    try {
      if (await networkInfo.isConnected) {
        return getQuoteRemoteDataSource.getRandomQuote();
      } else {
        return getQuoteLocalDataSource.getRandomQuote();
      }
    }catch(e){
      return Left(ServerFailure());
    }
  }
}