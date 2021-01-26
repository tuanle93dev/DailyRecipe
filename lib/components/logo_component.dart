import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 111,
                height: 111,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle),
              ),
              Column(
                children: [
                  Container(
                    width: 107,
                    height: 44,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/img_header_login.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Text(
                    'Daily Recipe',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
