import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/20/2022 at 09:47.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class LocaleDataSource {
  Future<Either<Failure, String>> getSavedLang();

  Future<Either<Failure, bool>> changeLocal(String locale);
}

class LocalDataSourceImpl extends LocaleDataSource {
  final SharedPreferences prefs;

  LocalDataSourceImpl({required this.prefs});

  @override
  Future<Either<Failure, bool>> changeLocal(String locale) async {
    var changed = await prefs.setString('locale', locale);
    return Right(changed);
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    final String locale = prefs.getString('locale') ?? '';
    return Right(locale);
  }

}