import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:provider/provider.dart';

class TakeModelTestPage extends StatefulWidget {
  const TakeModelTestPage({ Key? key }) : super(key: key);

  @override
  _TakeModelTestPageState createState() => _TakeModelTestPageState();
}

class _TakeModelTestPageState extends State<TakeModelTestPage> {
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
              QuestionOptionWidget(),
              QuestionOptionWidget()
            ]
          ),
        )
      )
    );
  }
}

class QuestionOptionWidget extends StatelessWidget {
  const QuestionOptionWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "1. This is first Question",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                tileColor: Colors.green[100],
                title: Text("Male"),
                leading: Radio(
                  value: 1,
                  groupValue: -1,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                trailing: Icon(Icons.check),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                tileColor: Colors.red[200],
                title: Text("Female"),
                leading: Radio(
                  value: 2,
                  groupValue: -1,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                trailing: Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}