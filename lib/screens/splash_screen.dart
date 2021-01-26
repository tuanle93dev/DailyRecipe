import 'dart:ui';

import 'package:dailyrecipe/components/logo_component.dart';
import 'package:dailyrecipe/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  void _registerTapped(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(),));

    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => RegisterScreen(),));

    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoComponent(),
                      Text(
                        'Cooking Done The Easy Way',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff7B7B7B),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  height: 50,
                  color: Color(0xffF55A00),
                  onPressed: () => _registerTapped(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  height: 50,
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
