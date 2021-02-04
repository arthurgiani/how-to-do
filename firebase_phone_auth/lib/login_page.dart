import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _smsCodeController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Firebase Phone Authentication",
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Phone Number"),
                  controller: _phoneController,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  child: Text("Verify phone"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () async =>
                      _verifyUserPhone(_phoneController.text),
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 48,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "SMS Code"),
                  controller: _smsCodeController,
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  child: Text("Send code"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () => _initManualPhoneAuthentication(),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _verifyUserPhone(String phoneNumber) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),

        // will be used when sms is filled automatically (in some devices, android only)
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          final user = await _auth.signInWithCredential(authCredential);
          if (user != null) {
            print('Login Successful via automatic input method');
            print(user);
          }
        },

        // triggered when phone number is invalid.
        verificationFailed: (FirebaseAuthException exception) {
          asuka.showSnackBar(SnackBar(
            content: Text(exception.message),
          ));
        },
        codeSent: (String verificationId, [int token]) {
          _verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationCode = verificationId;
        });
  }

  Future<void> _initManualPhoneAuthentication() async {
    try {
      final user = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: _verificationCode,
              smsCode: _smsCodeController.text));
      if (user != null) {
        print('Login Successful via manual input method');
        print(user.user);
      }
    } on Exception {
      asuka.showSnackBar(SnackBar(
        content: Text('Invalid sms code'),
      ));
    }
  }
}
