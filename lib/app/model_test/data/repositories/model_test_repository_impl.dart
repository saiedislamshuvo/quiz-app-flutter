import 'package:interview_task/core/errors/exceptions.dart';
import 'package:interview_task/core/networks/network_info.dart';
import 'package:interview_task/app/model_test/data/datasources/remote/model_test_remote_datasource.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:interview_task/app/model_test/domain/repositories/model_test_repository.dart';

class ModelTestRepositoryImpl implements ModelTestRepository {

  final ModelTestRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ModelTestRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ModelTestEntity>>> getModelTestList() async {
    if (await networkInfo.isConnected) {
      try {
        final modelTest = await remoteDataSource.getModelTestList();
        return Right(modelTest);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
      // try {

      // } on CacheException {
      //   return Left(CacheFailure());
      // }
    }
  }

}