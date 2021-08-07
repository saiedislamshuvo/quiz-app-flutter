import 'package:dartz/dartz.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';

abstract class ModelTestRepository {
  Future<Either<Failure, List<ModelTestEntity>>> getModelTestList();
}