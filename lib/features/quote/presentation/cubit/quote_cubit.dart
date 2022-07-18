import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/core/usecase.dart';
import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';
import 'package:quote_clean_archituctre/features/quote/domain/usecases/get_random_quote.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  GetRandomQuote randomQuote;

  QuoteCubit({required this.randomQuote}) : super(QuoteInitial());

  Future<void> getRandomQuote() async {
    emit(QuoteLoading());
    final Either<Failure, Quote> result = await randomQuote(NoParams());
    result.fold(
      (Failure failure) => emit(QuoteError(failure)),
      (Quote quote) => emit(QuoteLoaded(quote)),
    );
  }
}
