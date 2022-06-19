import 'package:demo_chat_app/screens/splash_page.dart';
import 'package:flutter/material.dart';

class OnBoardingPageTwo extends StatelessWidget {
  const OnBoardingPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/undraw_Chatting_re_j55r.png"),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Mental Health Friend",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 32, color: Colors.grey),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              "Talk to your mental health friend anytime, anyday",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.blue, width: 3))

                // Border.all(color: Colors.blue, width: 3),
                ),
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SplashPage())),
              child: Container(
                width: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.blue)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
