import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/19/2022 at 11:51.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

abstract class ChangeLocalRepository {
  Future<Either<Failure, bool>> changeLocal(String locale);

  Future<Either<Failure, String>> getSavedLang();
}