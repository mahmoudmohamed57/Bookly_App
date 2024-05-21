import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/features/home/data/data_source/local_data_source/home_detail_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote_data_source/home_detail_remote_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repository/home_detail_repository_implementation.dart';
import 'package:bookly/features/home/data/repository/home_repository_implementation.dart';
import 'package:bookly/features/home/domain/repository/home_details_repository.dart';
import 'package:bookly/features/home/domain/repository/home_repository.dart';
import 'package:bookly/features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/domain/use_case/fetch_similar_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  instance.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImplementation(instance()),
  );
  instance.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImplementation(),
  );
  instance.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplementation(
      homeRemoteDataSource: instance(),
      homeLocalDataSource: instance(),
    ),
  );
  instance.registerLazySingleton<HomeDetailRemoteDataSource>(
    () => HomeDetailRemoteDataSourceImplementation(instance()),
  );
  instance.registerLazySingleton<HomeDetailLocalDataSource>(
    () => HomeDetailLocalDataSourceImplementation(),
  );
  instance.registerLazySingleton<HomeDetailsRepository>(
    () => HomeDetailRepositoryImplementation(
      homeDetailRemoteDataSource: instance(),
      homeDetailLocalDataSource: instance(),
    ),
  );
}

initHomeModule() {
  if (!GetIt.I.isRegistered<FetchFeaturedBooksUseCase>()) {
    instance.registerFactory<FetchFeaturedBooksUseCase>(
      () => FetchFeaturedBooksUseCase(instance()),
    );
  }
  if (!GetIt.I.isRegistered<FetchNewestBooksUseCase>()) {
    instance.registerFactory<FetchNewestBooksUseCase>(
      () => FetchNewestBooksUseCase(instance()),
    );
  }
}

initHomeDetailModule() {
  if (!GetIt.I.isRegistered<FetchSimilarBooksUseCase>()) {
    instance.registerFactory<FetchSimilarBooksUseCase>(
      () => FetchSimilarBooksUseCase(instance()),
    );
  }
}
