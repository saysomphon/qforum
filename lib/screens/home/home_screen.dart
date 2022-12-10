import 'package:flutter/material.dart';
import 'package:qfoumn/constants/padding.dart';
import 'package:qfoumn/screens/home/widgets/notification_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [NotificationIconButton()],
      ),
      body: Padding(
          padding: const EdgeInsets.all(PaddingConstant.scaffoldPadding)),
    );
  }
}
