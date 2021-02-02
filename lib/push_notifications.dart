// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationsManager {

//   PushNotificationsManager._();

//   factory PushNotificationsManager() => _instance;

//   static final PushNotificationsManager _instance = PushNotificationsManager._();

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   bool _initialized = false;

//   Future<void> init() async {
//     if (!_initialized) {
//       // For iOS request permission first.
//       _firebaseMessaging.requestNotificationPermissions();
//       _firebaseMessaging.configure();

//       // For testing purposes print the Firebase Messaging token
//       String token = await _firebaseMessaging.getToken();
//       print("FirebaseMessaging token: $token");

//       _initialized = true;
//     }
//   }
// }

// FLUTTER APNS
import 'package:flutter_apns/flutter_apns.dart';

class PushNotificationsManager {
  final PushConnector connector = createPushConnector();
  String token = "";

  Future<void> init() async {
    final connector = this.connector;
    connector.token.addListener(() {
      this.token = connector.token.value;
      print('Token ${connector.token.value}');
    });
    connector.requestNotificationPermissions();
    if (connector is ApnsPushConnector) {
      connector.shouldPresent = (x) => Future.value(true);
    }
  }

  dynamic tokenValue() {
    return connector.token.runtimeType;
  }
}
