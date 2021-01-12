import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final String nameFromFirebaseNotification;
  const ThirdPage({Key key, this.nameFromFirebaseNotification})
      : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Congratulations! You're on Page 3"),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.nameFromFirebaseNotification ?? 'oi',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
