import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qfoumn/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  noticeBackGround();
  setNotifications();
  requestPermissionNotification();
  initInfo();
  runApp(const MyApp());
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
final streamCtlr = StreamController<String>.broadcast();
final titleCtlr = StreamController<String>.broadcast();
final bodyCtlr = StreamController<String>.broadcast();

setNotifications() {
  try {
    Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        if (message.data.containsKey('data')) {
          streamCtlr.sink.add(message.data['data']);
        }
        if (message.data.containsKey('notification')) {
          streamCtlr.sink.add(message.data['notification']);
        }
        titleCtlr.sink.add(message.notification!.title!);
        bodyCtlr.sink.add(message.notification!.body!);

        BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContent: true,
        );
        AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.high,
          styleInformation: bigTextStyleInformation,
          priority: Priority.high,
          playSound: true,
          // sound: RawResourceAndroidNotificationSound(''),
        );
        NotificationDetails platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
            0,
            message.notification?.title,
            message.notification?.body,
            platformChannelSpecifics,
            payload: message.data['title']);
      },
    );
  } catch (e) {
    // print(e);
  }
}

void requestPermissionNotification() async {
  try {
    await firebaseMessaging.getNotificationSettings();
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // print('User granted provisional permission');
    } else {
      // print('User declined or has not accepted permission');
    }
  } catch (e) {
    // print(e);
  }
}

Future<void> initInfo() async {
  try {
    var androidInnitialize =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOSInnitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInnitialize, iOS: iOSInnitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  } catch (e) {
    // print(e);
  }
}

// funtion get token firebase to send noticfication
Future noticeBackGround() async {
  WidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  firebaseMessaging.getToken().then((token) {
    if (token == null) {
      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        storage.write(key: "noticToken", value: fcmToken);
      }).onError((err) {});
    } else {
      // print(token);
      storage.write(key: "noticToken", value: token);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
