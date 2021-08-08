import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_question_entity.dart';
import 'package:interview_task/app/model_test/presentation/package/countdown/widgets/countdown_widget.dart';
import 'package:interview_task/app/model_test/presentation/pages/congrats_page.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:interview_task/app/model_test/presentation/widgets/question_option_widget.dart';
import 'package:interview_task/core/provider/view_state.dart';
import 'package:interview_task/core/utils/screen_navigator.dart';
import 'package:provider/provider.dart';

class TakeModelTestPage extends StatefulWidget {
  const TakeModelTestPage({ Key? key }) : super(key: key);

  @override
  _TakeModelTestPageState createState() => _TakeModelTestPageState();
}

class _TakeModelTestPageState extends State<TakeModelTestPage> {

  handleModelTestResult(BuildContext context, ModelTestProvider modelTestProvider, int modelTestId) async {
    await modelTestProvider.postModelTestResult(modelTestId);
    if(modelTestProvider.postModelTestResultStatus) ScreenNavigator.replacementScreenUntil(context, CongratsPage());
    else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Submit Failed, try again!")));
  }

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTestProvider>(
      builder: (BuildContext context, ModelTestProvider modelTestProvider, Widget? child) => Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text("Interview Task"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            modelTestProvider.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            modelTestProvider.id,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      CountdownFormatted(
                        duration: Duration(seconds: 1),
                        builder: (BuildContext ctx, String remaining, int inSecond) {
                          modelTestProvider.duration = inSecond;
                          return Text(
                            remaining,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: modelTestProvider.modelTestQuestionEntity.length,
                itemBuilder: (BuildContext context, int index) {
                  ModelTestQuestionEntity entity = modelTestProvider.modelTestQuestionEntity[index];
                  return QuestionOptionWidget(index: index, entity: entity,);
                },
              ),
              SizedBox(height: 20),
              modelTestProvider.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : modelTestProvider.state == ViewState.Error
              ? Center(child: Text('Oops, something wrong happened'))
              : ElevatedButton(
                onPressed: () => handleModelTestResult(context, modelTestProvider, modelTestProvider.modelTestQuestionEntity[0].modelTest!.id),
                child: Text("Submit"),
              ),
              SizedBox(height: 20),
            ]
          ),
        )
      )
    );
  }
}
