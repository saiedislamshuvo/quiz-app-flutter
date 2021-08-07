import 'package:dartz/dartz.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_question_entity.dart';
import 'package:interview_task/app/model_test/domain/usecases/get_model_test_question_usecase.dart';
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
  GetModelTestQuestionUsecase _modelTestQuestionUsecase = sl<GetModelTestQuestionUsecase>();

  DateTime today = DateTime.now();

  String _name = '';
  String get name => _name;
  set name(String value) => this._name = value;

  String _id = '';
  String get id => _id;
  set id(String value) => this._id = value;

  String _modelTestAction = '';
  String get modelTestAction => _modelTestAction;
  set modelTestAction(String value) => this._modelTestAction = value;

  List<ModelTestEntity> _modelTestEntity = [];
  List<ModelTestEntity> get modelTestEntity => _modelTestEntity;

  List<ModelTestQuestionEntity> _modelTestQuestionEntity = [];
  List<ModelTestQuestionEntity> get modelTestQuestionEntity => _modelTestQuestionEntity;

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

  void handleModelTestActionViaDate(ModelTestEntity entity) {
    int betweenExam = today.compareTo(entity.examStartDateTime);
    int endResult = today.compareTo(entity.examResultEndDateTime);
    if(endResult <= 0) {
      if(betweenExam == 0) {
        modelTestAction = "Take Exam";
      } else if(betweenExam < 0) {
        modelTestAction =  "Upcoming";
      } else {
        int beforeExam = today.compareTo(entity.examEndDateTime);
        if(beforeExam <= 0) {
          modelTestAction =  "Take Exam";
        } else {
          modelTestAction =  "Get Result";
        }
      }
    } else {
      modelTestAction =  "Archived";
    }
    setState(ViewState.Idle);
  }

  Future<void> fetchModelTestQuestion(int modelTestId) async {
    setState(ViewState.Busy);

    Either<Failure, List<ModelTestQuestionEntity>> results = await _modelTestQuestionUsecase(modelTestId);

    results.fold(
      (failure) {
        setState(ViewState.Error);
      },
      (List<ModelTestQuestionEntity> entity) {
        this._modelTestQuestionEntity = entity;
        setState(ViewState.Idle);
      },
    );
  }
  
}