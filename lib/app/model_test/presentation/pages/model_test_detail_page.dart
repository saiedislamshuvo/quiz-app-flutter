import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';
import 'package:interview_task/app/model_test/presentation/pages/model_test_result_page.dart';
import 'package:interview_task/app/model_test/presentation/pages/take_model_test._page.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:interview_task/core/utils/screen_navigator.dart';
import 'package:provider/provider.dart';

class ModelTestDetailPage extends StatefulWidget {
  final ModelTestEntity entity;
  const ModelTestDetailPage({ Key? key, required this.entity }) : super(key: key);

  @override
  _ModelTestDetailPageState createState() => _ModelTestDetailPageState();
}

class _ModelTestDetailPageState extends State<ModelTestDetailPage> {

  void handleModelTest(BuildContext context, ModelTestProvider modelTestProvider) {
    if(modelTestProvider.modelTestAction == "Take Exam") {
      ScreenNavigator.changeScreen(context, TakeModelTestPage());
    } else if(modelTestProvider.modelTestAction == "Upcoming") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Model Test Is Upcoming")));
    } else if(modelTestProvider.modelTestAction == "Get Result") {
      ScreenNavigator.changeScreen(context, ModelTestResultPage(modelTestId: widget.entity.id));
    } else if(modelTestProvider.modelTestAction == "Archived") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Model Test Is Archived")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("try again!")));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Provider.of<ModelTestProvider>(context, listen: false).handleModelTestActionViaDate(widget.entity);
      Provider.of<ModelTestProvider>(context, listen: false).fetchModelTestQuestion(widget.entity.id);
    });
    super.initState();
  }

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
                  child: Column(
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
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(widget.entity.coverImage)
                            ),
                            SizedBox(width: 15,),
                            Text(
                              widget.entity.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),  
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.entity.shortDescription,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Exam time: ${widget.entity.examTime}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                          ),
                        ),
                        Text(
                          "Negative Marks: ${widget.entity.negativeMarks}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.redAccent
                          ),
                        ),
                        Text(
                          "Pass Mark: ${widget.entity.passMarks}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green[600]
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Exam start date: ${widget.entity.examStartDateTime.day} - ${widget.entity.examStartDateTime.month} - ${widget.entity.examStartDateTime.year}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.orangeAccent
                          ),
                        ),
                        Text(
                          "Exam end date: ${widget.entity.examEndDateTime.day} - ${widget.entity.examEndDateTime.month} - ${widget.entity.examEndDateTime.year}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.orangeAccent
                          ),
                        ),
                        Text(
                          "Exam result date: ${widget.entity.examResultDateTime.day} - ${widget.entity.examResultDateTime.month} - ${widget.entity.examResultDateTime.year}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.orangeAccent
                          ),
                        ),
                        Text(
                          "Exam result end date: ${widget.entity.examResultEndDateTime.day} - ${widget.entity.examResultEndDateTime.month} - ${widget.entity.examResultEndDateTime.year}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.orangeAccent
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => handleModelTest(context, modelTestProvider),
                child: Text(
                  modelTestProvider.modelTestAction
                )
              )
            ]
          ),
        )
      ),
    );
  }
}