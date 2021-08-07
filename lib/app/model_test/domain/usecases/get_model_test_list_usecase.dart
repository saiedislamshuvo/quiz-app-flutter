import 'package:interview_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:interview_task/core/usecases/usecase.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';
import 'package:interview_task/app/model_test/domain/repositories/model_test_repository.dart';

class GetModelTestListUsecase implements UseCase<ModelTestEntity, NoParams> {
  final ModelTestRepository repository;

  GetModelTestListUsecase(this.repository);

  @override
  Future<Either<Failure, List<ModelTestEntity>>> call(params) async {
    return await repository.getModelTestList();
  }
}