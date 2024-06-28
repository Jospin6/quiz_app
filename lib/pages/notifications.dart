import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  int notificationId = 0;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
        const AndroidInitializationSettings("mipmap/ic_launcher");
  var initializationSettingsIOS = const IOSInitializationSettings();
  void initialiseNotifications(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    InitializationSettings initializationSettings = 
    InitializationSettings(android: initializationSettingsAndroid);

   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async{

   AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
    "channelId", 
    "channelName",
    importance: Importance.max,
    priority: Priority.high,
    ticker: "ticker");

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );

    flutterLocalNotificationsPlugin.show(
      0, 
      title, 
      body, 
      notificationDetails
    );
  }
 static Future showBigTextNotification({var id = 0, required String title, required String body,
    var payload, required FlutterLocalNotificationsPlugin ftn
  }) async{
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
    "channelId", 
    "channelName",
    playSound: true,
    // sound: RawResourceAndroidNotificationSound('notification'),
    importance: Importance.max,
    priority: Priority.high,
    ticker: "ticker");

    var not =  NotificationDetails(
      android: androidNotificationDetails
    );
    await ftn.show(0, 
    title, 
    body, 
    not,
    payload: payload);
  }
}