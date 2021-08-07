import 'package:dartz/dartz.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:interview_task/core/provider/base_provider.dart';
import 'package:interview_task/core/provider/view_state.dart';
import 'package:interview_task/core/usecases/usecase.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';
import 'package:interview_task/app/model_test/domain/usecases/get_model_test_list_usecase.dart';
import 'package:interview_task/injection_container.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ModelTestProvider extends BaseProvider {
  GetModelTestListUsecase _modelTestListUsecase = sl<GetModelTestListUsecase>();

  List<ModelTestEntity> _modelTestEntity = [];
  List<ModelTestEntity> get modelTestEntity => _modelTestEntity;

  Future<void> fetchModelTestList() async {
    setState(ViewState.Busy);

    Either<Failure, List<ModelTestEntity>> results = await _modelTestListUsecase(NoParams());

    results.fold(
      (failure) {
        setState(ViewState.Error);
      },
      (List<ModelTestEntity> entity) {
        this._modelTestEntity = entity;
        setState(ViewState.Idle);
      },
    );
  }
  
}