import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/features/quote/data/models/quote_model.dart';
import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';

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

class GetQuoteRemoteDataSourceImpl implements GetQuoteRemoteDataSource {
  @override
  Future<Either<Failure, QuoteModel>> getRandomQuote() async {
    return Right(QuoteModel(
        id: 1,
        quote: 'Get Quote From Api',
        author: 'Fady',
        permalink: 'link'));
  }
}