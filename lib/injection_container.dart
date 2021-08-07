import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:interview_task/core/networks/network_info.dart';
import 'package:interview_task/app/model_test/data/datasources/remote/model_test_remote_datasource.dart';
import 'package:interview_task/app/model_test/data/repositories/model_test_repository_impl.dart';
import 'package:interview_task/app/model_test/domain/repositories/model_test_repository.dart';
import 'package:interview_task/app/model_test/domain/usecases/get_model_test_list_usecase.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Provider
  sl.registerLazySingleton(() => ModelTestProvider());

  // Use Case
  sl.registerLazySingleton(() => GetModelTestListUsecase(sl()));

  // Repository
  sl.registerLazySingleton<ModelTestRepository>(
    () => ModelTestRepositoryImpl(networkInfo: sl(), remoteDataSource: sl())
  );

  // Data sources
  sl.registerLazySingleton<ModelTestRemoteDataSource>(
    () => ModelTestRemoteDataSourceImpl(client: sl())
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  sl.registerLazySingleton(() => http.Client());
  
}
