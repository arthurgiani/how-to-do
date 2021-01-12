import 'package:flutter/material.dart';
import 'package:notification_app/locator.dart';

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Congratulations! You're on Page 2"),
            RaisedButton(
              onPressed: () {
                locator
                    .get<NavigationService>()
                    .navigateTo('/thirdpage', arguments: {
                      'name':'There is no name because this was inserted on screen during app usage'
                    });
              },
              child: Text("Go to page 3"),
            )
          ],
        ),
      ),
    );
  }
}
