import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_tec/first_screen.dart';
import 'package:pro_tec/screens/create_request.dart';
import 'package:pro_tec/chat_screen.dart';
import 'package:pro_tec/personal_chat.dart';
import 'package:pro_tec/screens/details.dart';
import 'package:pro_tec/screens/signin.dart';
import 'package:pro_tec/screens/signup.dart';
import 'package:pro_tec/widgets/category.dart';
import 'package:pro_tec/widgets/my_card.dart';
import 'screens/firstaid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_tec/my_requests.dart';
import 'package:firebase_core/firebase_core.dart';
import 'new_event.dart';

import 'package:pro_tec/create_request_1.dart';
import 'screens/signin.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pro_tec/networking.dart';
import 'screens/firstAidScreens/low_bp.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // subscribe to topic on each app start-up
  await FirebaseMessaging.instance.subscribeToTopic('message');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: LowBp(),

    theme: ThemeData(hintColor: Colors.white),
    home:FirstScreen(),
  ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      "This channel is used for important notifications.", // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int current_screen = 0;
  List<dynamic> screens = [HomePage(), MyRequests(), ChatScreen(), FirstAid()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screens[current_screen],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewEvent()));
        },
        child: Image(
          image: AssetImage("images/button.png"),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        shape: CircularNotchedRectangle(),
        color: Color(0xFFFB4B4B),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            current_screen = 0;
                            setState(() {});
                          },
                          icon: FaIcon(FontAwesomeIcons.house),
                          color: (current_screen == 0)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              current_screen = 1;
                              setState(() {});
                            },
                            icon: FaIcon(FontAwesomeIcons.fileSignature),
                            color: (current_screen == 1)
                                ? Colors.white
                                : Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            current_screen = 2;
                            setState(() {});
                          },
                          icon: FaIcon(FontAwesomeIcons.solidCommentDots),
                          color: (current_screen == 2)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            current_screen = 3;
                            setState(() {});
                          },
                          icon: FaIcon(FontAwesomeIcons.briefcaseMedical),
                          color: (current_screen == 3)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  String token = "";
  void initState() {
    super.initState();
    //sol();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));

        setState(() {

        });
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
        setState(() {

        });
      }
    });

    getToken();
  }


  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print(token);
  }

  List<dynamic> data = [];

  Future sol() async {
    await log_in("sam@gmail.com", "1234567");
    data = await get_data(token);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image(
                image: AssetImage("images/Vector.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.25,
                height: MediaQuery.of(context).size.height / 1.75,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image(
                image: AssetImage("images/img.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/img2.jpg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hi, Samarth",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Text(
                      "Live Requests ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView(
                              children: [

                                Category(name: "Blood ", data: data[0]),
                                Category(name: "Medicine", data: data[1]),
                                Category(name: "Fund Raising", data: data[3]),
                                Category(name: "Others", data: data[2]),

                              ],
                            );
                          }

                          print(snapshot.connectionState);
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: sol(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: FloatingActionButton(
            elevation: 10,
            backgroundColor: Color(0xFFFF0000),
            onPressed: () async {
              launch("tel://102");
            },
            child: Text(
              "SOS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
