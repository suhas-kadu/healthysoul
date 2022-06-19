import 'package:demo_chat_app/providers/auth_provider.dart';
import 'package:demo_chat_app/screens/home.dart';
import 'package:demo_chat_app/screens/login_page.dart';
import 'package:demo_chat_app/utils/constants/color_constants.dart';
import 'package:demo_chat_app/utils/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Welcome to HealthySoul",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, color: Colors.grey),
              ),
            ),
            Image.asset(
              "assets/images/undraw_Showing_support_re_5f2v.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Asking for help\nis a sign of strength",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
