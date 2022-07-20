part of 'local_cubit.dart';

abstract class LocalState extends Equatable {
  final Locale locale;

  const LocalState(this.locale);

  @override
  List<Object> get props => [locale];
}

class ChangeLocalState extends LocalState {
  final Locale selectedLocale;
  const ChangeLocalState(this.selectedLocale) : super(selectedLocale);
}
