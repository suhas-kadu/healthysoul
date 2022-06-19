import 'package:demo_chat_app/providers/auth_provider.dart';
import 'package:demo_chat_app/screens/home.dart';
import 'package:demo_chat_app/utils/constants/color_constants.dart';
import 'package:demo_chat_app/utils/constants/size_constants.dart';
import 'package:demo_chat_app/utils/constants/textfield_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    Future.delayed(Duration.zero, () {
      switch (authProvider.status) {
        case Status.authenticateError:
          Fluttertoast.showToast(msg: 'Sign in failed');
          break;
        case Status.authenticateCanceled:
          Fluttertoast.showToast(msg: 'Sign in cancelled');
          break;
        case Status.authenticated:
          Fluttertoast.showToast(msg: 'Sign in successful');
          break;
        default:
          break;
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.dimen_30,
              horizontal: Sizes.dimen_20,
            ),
            children: [
              vertical50,
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to HealthySoul',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, color: Colors.grey),
                ),
              ),
              vertical20,
              Text(
                'Login to continue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
              ),
              vertical50,
              Center(
                  child: Image.asset(
                      'assets/images/undraw_a_whole_year_vnfm.png')),
              vertical50,
              ElevatedButton(
                  onPressed: () async {
                    bool isSuccess = await authProvider.handleGoogleSignIn();
                    if (isSuccess) {
                      WidgetsBinding.instance
                          .addPersistentFrameCallback((timeStamp) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.login,
                          size: 32,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text(
                          "Login with Google",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
              // GestureDetector(
              //   onTap: () async {
              //     bool isSuccess = await authProvider.handleGoogleSignIn();
              //     if (isSuccess) {
              //       WidgetsBinding.instance
              //           .addPersistentFrameCallback((timeStamp) {
              //         Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const Home()));
              //       });
              //     }
              //   },
              //   child: Image.asset('assets/images/google_login.jpg'),
              // ),
            ],
          ),
          Center(
            child: authProvider.status == Status.authenticating
                ? const CircularProgressIndicator(
                    color: AppColors.lightGrey,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
