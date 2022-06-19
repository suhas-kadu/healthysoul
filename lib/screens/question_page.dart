import 'package:demo_chat_app/models/question_answer.dart';
import 'package:demo_chat_app/screens/quiz_result.dart';
import 'package:demo_chat_app/screens/result_page.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<String> answers = <String>[];
  List<QuestionAnswer> questions = <QuestionAnswer>[
    QuestionAnswer(question: 'What is your gender ?', answers: [
      'Male',
      'Female',
      'Prefer not to say',
    ]),
    QuestionAnswer(question: 'What is your age ? ', answers: [
      ' <= 18',
      ' 18 < 40 ',
      ' >= 40',
    ]),
    QuestionAnswer(question: 'Describe your marital status', answers: [
      'Married',
      'Unmarried',
      'Divorcee',
    ]),
    QuestionAnswer(question: 'Total Number of kids ', answers: [
      ' 0 ',
      ' 1 or 2 ',
      ' > 2 ',
    ]),
    QuestionAnswer(question: 'Select your highest education level ', answers: [
      ' <=5 ',
      ' 5 > and <= 10 ',
      ' > 10 ',
    ]),
    QuestionAnswer(question: ' Do you get regular salary ? ', answers: [
      ' Yes ',
      ' No ',
      " I'm a Student ",
    ]),
    QuestionAnswer(
        question: ' What is the total number of members in your family ? ',
        answers: [
          ' Around 4 ',
          ' Around 10 ',
          ' More than 10 ',
        ]),
    QuestionAnswer(
        question: ' How will you describe your living expenses ? ',
        answers: [
          ' High ',
          ' Moderate ',
          ' Low ',
        ]),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return index >= questions.length
        ? ResultPage(
            answers: answers,
          )
        : Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      questions[index].question,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: questions[index].answers.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() {
                            setState(() {
                              answers.add(questions[index].answers[i]);
                              index += 1;
                            });
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4)),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(
                              questions[index].answers[i],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // Text(index.toString())
                ],
              ),
            ),
          );
  }
}
