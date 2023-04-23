import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase_options.dart';

// バックグラウンド メッセージ
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    var msg =
        "title: ${message.notification?.title ?? ''}, body: ${message.notification?.body ?? ''}";
    print('(backgrand)Message data: $msg');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // バックグラウンド メッセージ
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // フォアグラウンド メッセージ
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      var msg = """
            title: ${message.notification?.title ?? ''}
            body: ${message.notification?.body ?? ''}
            """;
      Fluttertoast.showToast(msg: msg);
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  String _fcmToken = "";

  Future<void> _incrementCounter() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    setState(() {
      if (fcmToken != null) {
        _fcmToken = fcmToken;
        print(_fcmToken);
      }
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
              'token:',
            ),
            Text(
              _fcmToken,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.token),
      ),
    );
  }
}
