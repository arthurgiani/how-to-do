import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/pages/home_page.dart';
import 'package:notification_app/pages/second_page.dart';
import 'package:notification_app/pages/third_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String,dynamic>args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/secondpage':
        return MaterialPageRoute(builder: (_) => SecondPage());
      case '/thirdpage':
        return MaterialPageRoute(builder: (_) => ThirdPage(
          nameFromFirebaseNotification: args['name'],
        ));
    }
  }
}
