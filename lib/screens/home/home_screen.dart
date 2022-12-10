import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/screens/home/widgets/card_forum_type.dart';
import 'package:qfoumn/screens/home/widgets/notification_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dataUser = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _forumTypeStream =
      FirebaseFirestore.instance.collection('forum_type').snapshots();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        title: Text(dataUser?.displayName ?? "Unfonud user name"),
        centerTitle: true,
        actions: const [
          NotificationIconButton(
            paddingAll: 16,
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _forumTypeStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CardForumType(title: data['name']),
                );
              }).toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: ColorsConstant.primaryColor,
          selectedFontSize: 16,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(height: 2),
        ),
      ),
    );
  }
}
