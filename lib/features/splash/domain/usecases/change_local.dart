import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/core/usecase.dart';
import 'package:quote_clean_archituctre/features/splash/domain/repositories/change_local_repository.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/19/2022 at 11:49.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class ChangeLocaleUseCase extends UseCase<bool, String> {
  ChangeLocalRepository localeRepository;

  ChangeLocaleUseCase({required this.localeRepository});

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return localeRepository.changeLocal(params);
  }
}