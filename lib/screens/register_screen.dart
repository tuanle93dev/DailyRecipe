import 'package:dailyrecipe/components/logo_component.dart';
import 'package:dailyrecipe/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _isHidePassword = true;


  void _signInTapped(BuildContext context){
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => SigninScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

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
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: _size.width,
                  height: _size.height - 30,
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoComponent(),
                      Text(
                        'Register',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 18),
                          hintText: 'Full Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffA0A0A0), width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffA0A0A0), width: 1.0)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/images/ic_user.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 18),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffA0A0A0), width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffA0A0A0), width: 1.0)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/images/ic_email.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        obscureText: _isHidePassword,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 18),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffA0A0A0), width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffA0A0A0), width: 1.0)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image.asset(
                              "assets/images/ic_password.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              print("abc");
                              setState(() {
                                _isHidePassword = !_isHidePassword;
                              });
                              // FocusScope.of(context).requestFocus(FocusNode());
                            },
                            icon: _isHidePassword
                                ? Icon(Icons.remove_red_eye)
                                : ImageIcon(
                                    AssetImage("assets/images/ic_showpass.png"),
                                    color: Colors.blueAccent,
                                  ),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.all(15),
                          //   child: FlatButton(
                          //     onPressed: ()=> {},
                          //     child: Image.asset(
                          //       "assets/images/ic_showpass.png",
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FlatButton(
                        onPressed: () => {},
                        height: 50,
                        color: Color(0xffF55A00),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Already registered? ',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff7B7B7B))),
                        TextSpan(
                          text: ' Sign in',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffF55A00),
                          ),
                          recognizer:  TapGestureRecognizer()
                            ..onTap = () => _signInTapped(context),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
