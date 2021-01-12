import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:notification_app/controllers/firebase_notification_controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirebaseNotificationController());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object arguments}) {
    return navigatorKey.currentState.pushNamed(routeName,arguments: arguments);
  }
}
