import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/screens/brainstom_post_it/branchstorm_post_it_screen.dart';
import 'package:qfoumn/screens/home/widgets/forum_list.dart';
import 'package:qfoumn/screens/home/widgets/logout_button.dart';
import 'package:qfoumn/screens/sign_in/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int _selectedIndex = 0;

  /// switch screen from bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logOut() async {
    await auth.signOut().then((value) async {
      GoogleSignIn().disconnect();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: _selectedIndex == 0
          ? const ForumList()
          : const BranstormPostItScreen(),
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  Container buildNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 9,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 80,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Brainstorming',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: ColorsConstant.backgroundColor,
        selectedItemColor: ColorsConstant.secondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("QForum", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 3),
          Text(auth.currentUser!.email ?? '',
              style: const TextStyle(color: Colors.black, fontSize: 17)),
        ],
      ),
      actions: [
        LogoutButton(
          onPress: logOut,
        )
      ],
    );
  }
}
