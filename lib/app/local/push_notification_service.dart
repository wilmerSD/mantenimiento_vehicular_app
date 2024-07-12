import 'dart:async';
import 'dart:math';
import 'package:app_valtx_asistencia/app/local/storage_service.dart';
import 'package:app_valtx_asistencia/core/helpers/keys.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  //Local notifications - settings
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> inicializeLocalNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {},
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) async {},
    );
  }

  static notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'ValtxSoundId',
        'ValtxSoundName',
        channelDescription: "ValtxSound",
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: false,
        sound: RawResourceAndroidNotificationSound('custom_sound'),
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payLoad,
  }) async {
    return flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      title,
      body,
      await notificationDetails(),
    );
  }

  @pragma('vm:entry-point')
  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    print("onBackgroundHandler ${message.data}");
    await showLocalNotification(
      title: message.data['title'],
      body: message.data['body'],
    );
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    print("onMessageHandler ${message.data}");
    await showLocalNotification(
      title: message.data['title'],
      body: message.data['body'],
    );
  }

  static Future<void> _onMessageOpenAppHandler(RemoteMessage message) async {
    print("onMessageOpenAppHandler ${message.data}");
    await showLocalNotification(
      title: message.data['title'],
      body: message.data['body'],
    );
  }

  static Future<void> inicializeApp() async {
    // Solicitando permiso para notificaciones
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
    );

    //Obtener token de dispositivo
    token = await FirebaseMessaging.instance.getToken();

    //Setear token en storage
    await StorageService.set(key: Keys.kTokenDevice, value: token);
    /* print("Toke device: $token"); */

    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenAppHandler);
  }
}




/* import 'dart:async';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static String? token;

  static final PushNotificationService _instance =
      PushNotificationService._internal();

  factory PushNotificationService() => _instance;

  PushNotificationService._internal();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  //Local notifications - settings
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> inicializeLocalNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {},
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payLoad,
  }) async {
    return flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      title,
      body,
      await notificationDetails(),
    );
  }

/* 
  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ico_notifications');

    // Crear detalles de notificación
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'EcxlaeSound',
      "EcxlaeSound",
      //icon: '@mipmap/ic_launcher',
      channelDescription: "local local",
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      enableVibration: false,
      sound: RawResourceAndroidNotificationSound('custom_sound'),
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) async {},
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // Mostrar notificación
    await flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      title,
      body,
      platformChannelSpecifics,
    );
  } */
  @pragma('vm:entry-point')
  Future<void> _onBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    await showLocalNotification(
      title: "XXXX", // message.data['title'],
      body: "ZZZZZ", // message.data['body'],
    );
  }

  Future<void> inicializeApp() async {
    // Solicitando permiso para notificaciones
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
    );

    //Obtener token de dispositivo
    token = await FirebaseMessaging.instance.getToken();
    print("Toke device: $token");

    // Manejo de mensajes en segundo plano usando el controlador especificado
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {});

    //Escuchando mensajes entrantes mientras la aplicación está en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await Firebase.initializeApp();
      await showLocalNotification(
        title: "XXXX", // message.data['title'],
        body: "ZZZZZ", // message.data['body'],
      );
    });

    // Manejando un evento de clic de notificación cuando la aplicación está en segundo plano
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await Firebase.initializeApp();
      await showLocalNotification(
        title: "XXXX", // message.data['title'],
        body: "ZZZZZ", // message.data['body'],
      );
    });
  }
}
 */