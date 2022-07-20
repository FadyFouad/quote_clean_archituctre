import 'package:dartz/dartz.dart';
import 'package:quote_clean_archituctre/core/error/failures.dart';
import 'package:quote_clean_archituctre/core/usecase.dart';
import 'package:quote_clean_archituctre/features/splash/domain/repositories/change_local_repository.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/19/2022 at 11:52.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class GetSavedLocalUseCase extends UseCase<String, NoParams> {
  final ChangeLocalRepository localRepository;

  GetSavedLocalUseCase({required this.localRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return localRepository.getSavedLang();
  }
}
