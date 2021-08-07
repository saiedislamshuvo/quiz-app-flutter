import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_task/core/errors/failures.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}

abstract class UseCaseSingle<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
