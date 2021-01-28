import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawerEnableOpenDragGesture: false,
        backgroundColor: Color(0xff010101),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset("assets/images/ic_menu.png"),
            color: Colors.white,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: Image.asset("assets/images/ic_notification.png"),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Drawer(
            child: Container(
              color: Color(0xff2D2D2D),
              child: Column(
                children: [
                  _buildHeaderDrawer(),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: DrawerHeader(
                        decoration: BoxDecoration(color: Colors.blueAccent),
                        child: Text("Header"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderDrawer(){
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        child: Wrap(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  child: Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: ExactAssetImage("assets/images/ic_avatar.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:double.infinity,
                        child: Text(
                          "Emma Holmes",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width:double.infinity,
                        child: Text(
                          "View Profile",
                          style: TextStyle(
                            color: Color(0xff7B7B7B),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

