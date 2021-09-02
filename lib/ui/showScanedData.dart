

import 'package:flutter/material.dart';

const bool loginAlways = false;

class ShowData extends StatefulWidget {
  String? data;
  ShowData({Key? key,this.data}) : super(key: key) {
   
  }

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Your scanned QR code is " + widget.data!),
        ),
      ),
    );
  }
}
