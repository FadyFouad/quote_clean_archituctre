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
import 'package:shared_preferences/shared_preferences.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/18/2022 at 14:11.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

final sl = GetIt.instance;

void init() {
  // sl.registerSingleton<DioClient>(DioClient());
  externals();
  dataSource();
  repositories();
  useCase();
  cubit();
}

void cubit() {
  sl.registerFactory(() => QuoteCubit(randomQuote: sl()));
}

void useCase() {
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
}

void dataSource() {
  sl.registerLazySingleton<GetQuoteRemoteDataSource>(
      () => GetQuoteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<GetQuoteLocalDataSource>(
      () => GetQuoteLocalDataSourceImpl());
}

void initPrefManager(SharedPreferences _initPrefManager) {
  // sl.registerLazySingleton<PrefManager>(() => PrefManager(_initPrefManager));
}

void externals() {
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: Dio()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
}
