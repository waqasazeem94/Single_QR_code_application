import 'package:flutter/material.dart';
import 'package:flutter_qr_code_application/background.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController? emailInputController;
  TextEditingController? pwdInputController;

  bool? progressBarVisible;

  @override
  initState() {
    super.initState();

    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    // appManager = AppManager.instance;
    progressBarVisible = false;
  }

  String? emailValidator(String? value) {
    Pattern? pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp? regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value!)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }
  String? pwdValidator(String? value) {
    if (value!.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  void showOkMessage(
    BuildContext context,
    String title,
    String message, {
    bool cancelable = true,
    Function? onDismiss,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                if (onDismiss != null) onDismiss();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      //),
      body: Background(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Scanner App",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA),
                              fontSize: 36),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),

                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 0.0)),
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.blue, fontSize: 20.0),
                            labelText: 'Email*',
                            hintText: "john.doe@gmail.com"),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 0.0)),
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.blue, fontSize: 20.0),
                            labelText: 'Password*',
                            hintText: "********"),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: RaisedButton(
                          //child: Text("Login"),
                          color: Theme.of(context).primaryColor,
                          //textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/scanfqr');
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
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          padding: const EdgeInsets.all(0),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 10),
                      //   alignment: Alignment.centerRight,
                      //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      //   child: InkWell(
                      //     onTap: () => {
                      //       Navigator.push(
                      //           context, MaterialPageRoute(builder: (context) {}))
                      //     },
                      //     child: Text(
                      //       "Don't Have an Account? Sign up",
                      //       style: TextStyle(
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.bold,
                      //           color: Color(0xFF2661FA)),
                      //     ),
                      //   ),
                      // )
                      // FlatButton(
                      //   child: Text("Don't have an account yet?"),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, "/register");
                      //   },
                      // ),
                      // Text("Don't have an account yet?"),
                      // FlatButton(
                      //   child: Text("Register here!"),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, "/register");
                      //   },
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: progressBarVisible!,
              child: Container(
                color: Colors.grey.withOpacity(0.4),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
