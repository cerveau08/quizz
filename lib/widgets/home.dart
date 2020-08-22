import 'package:flutter/material.dart';
import 'package:quizz/widgets/custom_text.dart';
import 'package:quizz/widgets/page_quizz.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title,),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 11,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset("assets/images/quizz2.png",
                //  fit: BoxFit.cover
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageQuizz())
                );
              },
              child: CustomText("Commencer le quizz",
                factor: 2.0,
              )
            )
          ],
        ),
      ),
    );
  }
}
