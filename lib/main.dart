import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_property_app/property/property_listing.dart';
import 'package:flutter_property_app/property/property_sell.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Initialise the plugin
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }

    // Navigate to PropertySell page
    if (context.mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PropertySell()),
      );
    }
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // Display a dialog with the notification details, tap ok to go to another page
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: body != null ? Text(body) : null,
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PropertySell(),
                  ),
                );
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Property App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: PropertyListing(),
      routes: {
        PropertySell.routeName: (context) => PropertySell(),
      },
    );
  }
}

Future<void> repeatNotification(String propertyName, String contact) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'm_channel_id',
    'm_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
  );
  // var iOSPlatformChannelSpecifics = IOSNotificationDetails(
  //   sound: 'default',
  // );

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.periodicallyShow(
    0,
    propertyName,
    contact,
    RepeatInterval.daily,
    platformChannelSpecifics,
  );
}
