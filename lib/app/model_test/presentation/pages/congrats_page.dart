import 'package:flutter/material.dart';
import 'package:interview_task/app/model_test/presentation/pages/home_page.dart';
import 'package:interview_task/core/utils/screen_navigator.dart';

class CongratsPage extends StatelessWidget {
  final bool passOrFail;
  const CongratsPage({ Key? key, this.passOrFail = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Congratulations",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Thanks for take model test.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Image.asset("assets/congrats.png", fit: BoxFit.cover, width: MediaQuery.of(context).size.width,),
            passOrFail ? Text("You Had Pass This Exam") : Text("You Had Fail In This Exam! try again"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ScreenNavigator.replacementScreenUntil(context, HomePage()),
              child: Text("Home"),
            ),
            SizedBox(height: 20),
          ]
        ),
      )
    );
  }
}