import 'package:demo_chat_app/providers/auth_provider.dart';
import 'package:demo_chat_app/screens/login_page.dart';
import 'package:demo_chat_app/utils/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  PageController pageController = PageController();
  late AuthProvider authProvider;

  @override
  void initState() {
    authProvider = context.read<AuthProvider>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void onIconTapped(int page) {
    pageController.jumpToPage(page);
  }

  Future<void> googleSignOut() async {
    authProvider.googleSignOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          onPageChanged: onPageChanged,
          // scrollBehavior: ScrollBehavior(),
          scrollDirection: Axis.horizontal,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return screens[_page];
          }),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black87,
          currentIndex: _page,
          onTap: onIconTapped,
          items: [
            const BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
            // const BottomNavigationBarItem(
            //     icon: Icon(Icons.podcasts), label: ""),
            const BottomNavigationBarItem(
                icon: const Icon(Icons.video_library), label: ""),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
    );
  }
}
