import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_app/locator.dart';

class FirebaseNotificationController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final NavigationService _navigationService = locator.get<NavigationService>();

  initializeFirebaseNotifications() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _goToPage3(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _goToPage3(message);
      },
    );

    _firebaseMessaging.getToken().then((value) => print(value));
    
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
  }
  

  _goToPage3(Map<String, dynamic> message) {
    var view = message['data']['view'];
    if (view != null) {
      print(message['notification'].toString());
      if (view == 'third_screen') {
        _navigationService.navigateTo('/thirdpage', arguments: {
          'name': message['data']['name']
        });
      }
    }
  }
}
