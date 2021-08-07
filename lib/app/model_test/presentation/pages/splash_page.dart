import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/presentation/pages/home_page.dart';
import 'package:interview_task/app/model_test/presentation/providers/model_test_provider.dart';
import 'package:interview_task/core/presentation/base_view.dart';
import 'package:interview_task/core/utils/screen_navigator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  handleEntry() async {
    if (this._formkey.currentState!.validate()) {
      this._formkey.currentState?.save();
      ScreenNavigator.replacementScreen(context, HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ModelTestProvider>(
      onReady: (provider) => provider.fetchModelTestList(),
      builder: (context, modelTestProvider, child) => Scaffold(
        backgroundColor: Colors.deepPurple[50],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                  elevation: 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Entry",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Id',
                                ),
                                validator: (String? value){
                                  if(value!.isEmpty) return "This field can't be empty!";
                                  return null;
                                },
                                onChanged: (value){},
                              ),
                              SizedBox(height: 20,),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                ),
                                validator: (String? value){
                                  if(value!.isEmpty) return "This field can't be empty!";
                                  return null;
                                },
                                onChanged: (value){},
                              ),
                              SizedBox(height: 25,),
                              ElevatedButton(
                                onPressed: () => handleEntry(),
                                child: Text("Next"),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}