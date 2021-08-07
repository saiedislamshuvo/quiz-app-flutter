import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';
import 'package:interview_task/app/model_test/presentation/pages/model_test_detail_page.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:interview_task/core/provider/view_state.dart';
import 'package:interview_task/core/utils/screen_navigator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      
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
              modelTestProvider.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : modelTestProvider.state == ViewState.Error
              ? Center(child: Text('Oops, something wrong happened'))
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: modelTestProvider.modelTestEntity.length,
                  itemBuilder: (BuildContext context, int index) {
                    ModelTestEntity entity = modelTestProvider.modelTestEntity[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        onTap: () => ScreenNavigator.changeScreen(context, ModelTestDetailPage(entity: entity)),
                        title: Text(entity.title),
                        subtitle: Text(entity.shortDescription),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(entity.coverImage)
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            ]
          ),
        )
      ),
    );
  }
}