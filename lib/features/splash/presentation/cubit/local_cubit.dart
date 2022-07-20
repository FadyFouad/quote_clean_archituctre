import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quote_clean_archituctre/core/usecase.dart';
import 'package:quote_clean_archituctre/features/splash/domain/usecases/change_local.dart';
import 'package:quote_clean_archituctre/features/splash/domain/usecases/get_saved_local.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final GetSavedLocalUseCase getLocalUseCase;
  final ChangeLocaleUseCase changeLocaleUseCae;

  LocalCubit({
    required this.getLocalUseCase,
    required this.changeLocaleUseCae,
  }) : super(const ChangeLocalState(Locale('en')));

  var currentLangCode = 'en';

  _getSavedLocal() async {
    final response = await getLocalUseCase(NoParams());
    response.fold((failure) => debugPrint('Failed'), (value) {
      currentLangCode = value;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLocal(String langCode) async {
    final response = await changeLocaleUseCae(langCode);
    response.fold((failure) => debugPrint('cacheFailure'), (value) {
      currentLangCode = langCode;
      emit(ChangeLocalState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLocal('en');

  void toArabic() => _changeLocal('ar');
}
