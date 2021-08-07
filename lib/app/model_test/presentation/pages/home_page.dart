import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';
import 'package:interview_task/core/presentation/base_view.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:interview_task/core/provider/view_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ModelTestProvider>(
      builder: (context, modelTestProvider, child) => Scaffold(
        appBar: AppBar(
          title: Text("Interview Task"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              modelTestProvider.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : modelTestProvider.state == ViewState.Error
              ? Center(child: Text('Oops, something wrong happened'))
              : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: modelTestProvider.modelTestEntity.length,
                itemBuilder: (BuildContext context, int index) {
                  ModelTestEntity entity = modelTestProvider.modelTestEntity[index];
                  return ListTile(
                    title: Text(entity.title),
                  );
                },
              ),
            ]
          ),
        )
      ),
    );
  }
}