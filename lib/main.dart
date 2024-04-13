import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:registration_scanner/pages/partipant_list.dart';
import 'package:registration_scanner/pages/registration.dart';
import 'package:registration_scanner/pages/results.dart';
import 'package:registration_scanner/pages/scanner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List cameras = await availableCameras();
  runApp(MyApp(
    camera: cameras[0],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.camera});
  final CameraDescription camera;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [Scanner(), ParticipantList()];

  int currentScreen = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration scanner',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration'),
        ),
        body: screens[currentScreen],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentScreen = value;
              });
            },
            currentIndex: currentScreen,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.scanner), label: "scanner"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.app_registration), label: "register")
            ]),
      ),
    );
  }
}
