import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  List<String> answers;

  ResultPage({required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                answers[index],
                style: TextStyle(fontSize: 18),
              )),
            );
          },
        ),
      ),
    );
  }
}
