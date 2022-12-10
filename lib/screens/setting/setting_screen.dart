import 'package:flutter/material.dart';
import 'package:qfoumn/authen_method.dart';
import 'package:qfoumn/screens/google/google_screen.dart';
import 'package:qfoumn/widgets/show_toast.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          centerTitle: true,
          title: const Text(
            'Setting',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 25, 97, 156),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SettingList(
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {},
            ),
            SettingList(
              icon: Icons.account_balance_outlined,
              title: 'About Us',
              onTap: () {},
            ),
            SettingList(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                AuthenMethod()
                    .logout()
                    .then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const GoogleSigninScreen(),
                        ),
                        (Route<dynamic> route) => false))
                    .catchError((e) => showToast(message: e));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingList extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  const SettingList(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2.0, color: Colors.grey),
          ),
        ),
        height: 60,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
