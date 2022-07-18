import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/core/usecase.dart';
import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';
import 'package:quote_clean_archituctre/features/quote/domain/repositories/quote_repository.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 13:00.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GetRandomQuote extends UseCase<Quote, NoParams> {
  final QuoteRepository repository;
  GetRandomQuote({required this.repository});

  @override
  Future<Either<Failure,Quote>> call(NoParams params){
    return repository.getRandomQuote();
  }
}