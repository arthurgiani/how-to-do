import 'package:flutter/material.dart';
import 'package:notification_app/controllers/firebase_notification_controller.dart';
import 'package:notification_app/locator.dart';
import 'package:notification_app/pages/second_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FirebaseNotificationController _firebaseNotificationController;

  @override
  void initState() {
    _firebaseNotificationController =
        locator.get<FirebaseNotificationController>();
    _firebaseNotificationController.initializeFirebaseNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage())),
              child: 
              Text('Go to second page'),
            )
          ],
        ),
      ),
    );
  }
}
