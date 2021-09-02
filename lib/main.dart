


import 'package:flutter/material.dart';
import 'package:flutter_qr_code_application/ui/loginPage..dart';
import 'package:flutter_qr_code_application/ui/scanFirstQrCode.dart';
import 'package:flutter_qr_code_application/ui/splash.dart';

void main() {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // Isolate.spawn(checkDbAndUpload, "loop");
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => SplashPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/scanfqr': (BuildContext context) => ScanFirstQrCode(),
        // '/videoPlayer': (BuildContext context) => Video(),
        // '/allMedia': (BuildContext context) => AllMedia(),
      },
    );
  }
}
