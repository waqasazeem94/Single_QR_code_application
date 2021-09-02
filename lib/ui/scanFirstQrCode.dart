import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_code_application/ui/showScanedData.dart';

class ScanFirstQrCode extends StatefulWidget {
  ScanFirstQrCode();

  @override
  _ScanFirstQrCodeState createState() => _ScanFirstQrCodeState();
}

class _ScanFirstQrCodeState extends State<ScanFirstQrCode> {
  String? barCodeData2;

  @override
  void initState() {
    super.initState();
    _scan();
  }

  _scan() async {
    print("inside scaner");

    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.QR)
        .then(
      (value) {
        print("inside qr code");
        setState(() {
          barCodeData2 = value;
        });
      },
    );

    print("your bar code of first product is: " + barCodeData2!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: barCodeData2 == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      //alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: RaisedButton(
                        //child: Text("Login"),
                        color: Theme.of(context).primaryColor,
                        //textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowData(
                                  data: barCodeData2!,
                                ),
                              ));
                          // Navigator.pushReplacementNamed(context, '/ScanFirstQrCode');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: size.width * 0.5,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: new LinearGradient(colors: [
                                Color.fromARGB(255, 255, 136, 34),
                                Color.fromARGB(255, 255, 177, 41)
                              ])),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "Show Data",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
