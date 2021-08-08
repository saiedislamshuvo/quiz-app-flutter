import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_result_entity.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:interview_task/core/provider/view_state.dart';
import 'package:provider/provider.dart';

class ModelTestResultPage extends StatefulWidget {
  final int modelTestId;
  const ModelTestResultPage({ Key? key, required this.modelTestId }) : super(key: key);

  @override
  _ModelTestResultPageState createState() => _ModelTestResultPageState();
}

class _ModelTestResultPageState extends State<ModelTestResultPage> {

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      ModelTestProvider provider = Provider.of<ModelTestProvider>(context, listen: false);
      provider.fetchModelTestResult(widget.modelTestId, int.parse(provider.id));
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
              SizedBox(height: 20),
              modelTestProvider.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : modelTestProvider.state == ViewState.Error
              ? Center(child: Text('Oops, something wrong happened'))
              : modelTestProvider.modelTestResultEntity.length == 0
              ? Center(child: Text("Take Model Test First"),)
              : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: modelTestProvider.modelTestResultEntity.length,
                itemBuilder: (BuildContext context, int index) {
                  ModelTestResultEntity modelTestResultEntity = modelTestProvider.modelTestResultEntity[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {}, 
                              child: modelTestResultEntity.passFail == "P" ? Text("Passed") : Text("Failed")
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Model Test Id: ${modelTestResultEntity.id}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),
                            ),
                            Text(
                              "Total Question Attended: ${modelTestResultEntity.totalQuestionAttended}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),
                            ),
                            Text(
                              "Total Right Answer ${modelTestResultEntity.totalRightAnswer}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[600]
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Total Wrong Answer: ${modelTestResultEntity.totalWrongAnswer}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.redAccent
                              ),
                            ),
                            Text(
                              "Total Negative Marks: ${modelTestResultEntity.totalNegativeMarks}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.redAccent
                              ),
                            ),
                            Text(
                              "Total Marks: ${modelTestResultEntity.totalMarks}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[600]
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  );
                },
              ),
            ]
          ),
        )
      )
    );
  }
}