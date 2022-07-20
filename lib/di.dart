import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quote_clean_archituctre/core/network/api/api_consumer.dart';
import 'package:quote_clean_archituctre/core/network/api/dio_consumer.dart';
import 'package:quote_clean_archituctre/core/network/network_info.dart';
import 'package:quote_clean_archituctre/features/quote/data/local/quote_local_data_source.dart';
import 'package:quote_clean_archituctre/features/quote/data/remote/quote_remote_data_source.dart';
import 'package:quote_clean_archituctre/features/quote/data/repositories/quote_repository_imp.dart';
import 'package:quote_clean_archituctre/features/quote/domain/repositories/quote_repository.dart';
import 'package:quote_clean_archituctre/features/quote/domain/usecases/get_random_quote.dart';
import 'package:quote_clean_archituctre/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:quote_clean_archituctre/features/splash/data/data_sources/local_data_source.dart';
import 'package:quote_clean_archituctre/features/splash/data/repositories/local_repository_impl.dart';
import 'package:quote_clean_archituctre/features/splash/domain/repositories/change_local_repository.dart';
import 'package:quote_clean_archituctre/features/splash/domain/usecases/change_local.dart';
import 'package:quote_clean_archituctre/features/splash/domain/usecases/get_saved_local.dart';
import 'package:quote_clean_archituctre/features/splash/presentation/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 14:11.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerSingleton<DioClient>(DioClient());
  externals();
  dataSource();
  repositories();
  useCase();
  cubit();

  await initPrefManager();
}

Future<void> initPrefManager() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

void useCase() {
  sl.registerLazySingleton<GetSavedLocalUseCase>(
      () => GetSavedLocalUseCase(localRepository: sl()));

  sl.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(localeRepository: sl()));

  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(repository: sl()));
}

void repositories() {
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImp(
      networkInfo: sl(),
      getQuoteRemoteDataSource: sl(),
      getQuoteLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ChangeLocalRepository>(
    () => LocalRepositoryImpl(localeDataSource: sl()),
  );
}

void dataSource() async {
  sl.registerLazySingleton<GetQuoteRemoteDataSource>(
      () => GetQuoteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<GetQuoteLocalDataSource>(
      () => GetQuoteLocalDataSourceImpl());

  /// inject DataSource
  sl.registerLazySingleton<LocaleDataSource>(
      () => LocalDataSourceImpl(prefs: sl()));
}

void cubit() {
  sl.registerFactory(() => QuoteCubit(randomQuote: sl()));
  sl.registerFactory(
      () => LocalCubit(getLocalUseCase: sl(), changeLocaleUseCae: sl()));
}

void externals() {
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: Dio()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
}
