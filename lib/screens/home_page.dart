import 'package:demo_chat_app/providers/auth_provider.dart';
import 'package:demo_chat_app/screens/login_page.dart';
import 'package:demo_chat_app/screens/question_page.dart';
import 'package:demo_chat_app/utils/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthProvider authProvider;
  late String currentUserId;

  Future<void> googleSignOut() async {
    authProvider.googleSignOut();
    // Navigator.of(context).push( MaterialPageRoute(builder: (context) => const LoginPage()) );
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  void initState() {
    authProvider = context.read<AuthProvider>();

    if (authProvider.getFirebaseUserId()?.isNotEmpty == true) {
      currentUserId = authProvider.getFirebaseUserId()!;
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HealthySoul"),
          actions: [
            IconButton(
                onPressed: () => googleSignOut(), icon: Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/undraw_virtual_assistant_jjo2.png",
                height: 256,
                width: 256,
              ),
              SizedBox(
                height: 16,
              ),
              const Text(
                "Answer few questions so that we can recommend you best podcasts and youtube videos",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QuestionPage())),
                  child: const Text(
                    "Proceed",
                    textAlign: TextAlign.center,
                  )),
              // QuestionPage(),
            ],
          ),
        ));
  }
}
