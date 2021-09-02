import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr_code_application/ui/loginPage..dart';

const bool loginAlways = false;

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key) {
    
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 

  @override
  initState() {
    super.initState();
   

    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );
  }
}
