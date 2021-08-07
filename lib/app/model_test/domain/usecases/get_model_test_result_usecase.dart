import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_result_entity.dart';
import 'package:interview_task/app/model_test/domain/repositories/model_test_repository.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:interview_task/core/usecases/usecase.dart';

class GetModelTestResultUsecase implements UseCase<ModelTestResultEntity, Params> {
  final ModelTestRepository repository;

  GetModelTestResultUsecase(this.repository);

  @override
  Future<Either<Failure, List<ModelTestResultEntity>>> call(params) async {
    return await repository.getModelTestResult(params.modelTestId, params.studentId);
  }
}

class Params extends Equatable {
  final int? modelTestId;
  final int? studentId;

  Params({this.modelTestId, this.studentId});

  @override
  List<Object?> get props => [
    modelTestId,
    studentId
  ];
}