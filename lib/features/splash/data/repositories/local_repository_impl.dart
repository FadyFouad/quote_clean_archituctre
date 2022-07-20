import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/features/splash/data/data_sources/local_data_source.dart';
import 'package:quote_clean_archituctre/features/splash/domain/repositories/change_local_repository.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/20/2022 at 09:26.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class LocalRepositoryImpl implements ChangeLocalRepository {
  LocaleDataSource localeDataSource;

  LocalRepositoryImpl({required this.localeDataSource});

  @override
  Future<Either<Failure, bool>> changeLocal(String locale) async {
    return localeDataSource.changeLocal(locale);
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    return localeDataSource.getSavedLang();
  }
}
