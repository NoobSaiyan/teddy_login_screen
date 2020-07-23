import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF1F2B42),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pass = 'admin';
  String animationType = 'idle';
  final passwordController = TextEditingController();
  final textFocusNode = FocusNode();

  @override
  void initState() {
    textFocusNode.addListener(() {
      if (textFocusNode.hasFocus) {
        setState(() {
          animationType = 'test';
        });
      } else {
        setState(() {
          animationType = 'idle';
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            height: 200,
            width: 200,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: ClipOval(
                child: FlareActor(
                  'assets/teddy_test.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationType,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
              Divider(),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: passwordController,
                focusNode: textFocusNode,
              ),
            ],
          ),
        ),

        //button
        Container(
          width: double.infinity,
          height: 70,
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
            color: Colors.pink,
            child: Text(
              'Submit',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              if (passwordController.text.compareTo(pass) == 0) {
                print('success');
                setState(() {
                  animationType = 'success';
                });
              } else {
                print('fail');
                setState(() {
                  animationType = 'fail';
                });
              }
            },
          ),
        )
      ],
    );
  }
}
