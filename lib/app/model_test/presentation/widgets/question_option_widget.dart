import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_question_entity.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:provider/provider.dart';

class QuestionOptionWidget extends StatefulWidget {
  final ModelTestQuestionEntity entity;
  final int index;
  const QuestionOptionWidget({Key? key, required this.index, required this.entity}) : super(key: key);

  @override
  _QuestionOptionWidgetState createState() => _QuestionOptionWidgetState();
}

class _QuestionOptionWidgetState extends State<QuestionOptionWidget> {

  int groupVal = -1;

  void handleOption({required int value, required String option, required ModelTestProvider modelTestProvider}) {
    if(groupVal == -1) {
      groupVal = value;
      modelTestProvider.totalQuestionAttended++;
      if(option.compareTo(widget.entity.correctAnswer) == 0) {
        modelTestProvider.totalRightAnswer++;
      } else {
        modelTestProvider.totalWrongAnswer++;
      }
      modelTestProvider.totalNegativeMarks = modelTestProvider.totalWrongAnswer * (widget.entity.modelTest != null ? widget.entity.modelTest!.negativeMarks : 0);
      modelTestProvider.totalMarks = modelTestProvider.totalRightAnswer - modelTestProvider.totalNegativeMarks;
      if(modelTestProvider.totalMarks >= (widget.entity.modelTest != null ? widget.entity.modelTest!.passMarks : 0)) {
        modelTestProvider.passFail = "P";
      } else {
        modelTestProvider.passFail = "F";
      }
      setState(() {});
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTestProvider>(
      builder: (BuildContext context, ModelTestProvider modelTestProvider, Widget? child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "${widget.index + 1} . ${widget.entity.question}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    RadioListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: 1 == groupVal 
                      ? widget.entity.option1.compareTo(widget.entity.correctAnswer) == 0 ? Colors.green[200] : Colors.red[200]
                      : Colors.transparent,
                      title: Text(widget.entity.option1),
                      value: 1,
                      groupValue: groupVal,
                      onChanged: (int? value) => handleOption(value: value??-1, option: widget.entity.option1, modelTestProvider: modelTestProvider,),
                      activeColor: Colors.green,
                    ),
                    RadioListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: 2 == groupVal 
                      ? widget.entity.option2.compareTo(widget.entity.correctAnswer) == 0 ? Colors.green[200] : Colors.red[200]
                      : Colors.transparent,
                      title: Text(widget.entity.option2),
                      value: 2,
                      groupValue: groupVal,
                      onChanged: (int? value) => handleOption(value: value??-1, option: widget.entity.option2, modelTestProvider: modelTestProvider,),
                      activeColor: Colors.green,
                    ),
                    RadioListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: 3 == groupVal 
                      ? widget.entity.option3.compareTo(widget.entity.correctAnswer) == 0 ? Colors.green[200] : Colors.red[200]
                      : Colors.transparent,
                      title: Text(widget.entity.option3),
                      value: 3,
                      groupValue: groupVal,
                      onChanged: (int? value) => handleOption(value: value??-1, option: widget.entity.option3, modelTestProvider: modelTestProvider,),
                      activeColor: Colors.green,
                    ),
                    RadioListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: 4 == groupVal
                      ? widget.entity.option4.compareTo(widget.entity.correctAnswer) == 0 ? Colors.green[200] : Colors.red[200]
                      : Colors.transparent,
                      title: Text(widget.entity.option4),
                      value: 4,
                      groupValue: groupVal,
                      onChanged: (int? value) => handleOption(value: value??-1, option: widget.entity.option4, modelTestProvider: modelTestProvider,),
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}