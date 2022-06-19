import 'package:demo_chat_app/screens/onboarding/onboarding_page2.dart';
import 'package:flutter/material.dart';

class OnBoardingPageOne extends StatelessWidget {
  const OnBoardingPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/undraw_a_whole_year_vnfm.png"),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Hey you\nthankyou for being here",
            style: TextStyle(fontSize: 32, color: Colors.grey),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              "This is the first step in your mental health journey and we are so happy to be the part of it",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
                border: const Border(
                    top: const BorderSide(color: Colors.blue, width: 3))

                // Border.all(color: Colors.blue, width: 3),
                ),
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingPageTwo())),
              child: Container(
                width: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Next",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.blue)
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
