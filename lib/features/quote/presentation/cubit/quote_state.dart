part of 'quote_cubit.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Quote quote;

  QuoteLoaded(this.quote);
}

class QuoteError extends QuoteState {
  final Failure failure;

  QuoteError(this.failure);
}
