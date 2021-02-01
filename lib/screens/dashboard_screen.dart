import 'package:dailyrecipe/objects/menu_obj.dart';
import 'package:dailyrecipe/screens/settings_screen.dart';
import 'package:dailyrecipe/screens/signin_screen.dart';
import 'package:dailyrecipe/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'about_screen.dart';
import 'favorites_screen.dart';
import 'help_screen.dart';
import 'home_screen.dart';
import 'recently_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<MenuObject> _listMenu = [
    MenuObject(
      menuName: "Home",
      assetName: "assets/svgs/ic_home_active.svg",
    ),
    MenuObject(
      menuName: "Favorites",
      assetName: "assets/svgs/ic_like.svg",
    ),
    MenuObject(
      menuName: "Recently Viewed",
      assetName: "assets/svgs/ic_play.svg",
    ),
    MenuObject(
      menuName: "Settings",
      assetName: "assets/svgs/ic_setting.svg",
    ),
    MenuObject(
      menuName: "About Us",
      assetName: "assets/svgs/ic_info.svg",
    ),
    MenuObject(
      menuName: "Help",
      assetName: "assets/svgs/ic_help.svg",
    ),
    MenuObject(
      menuName: "Sign Out",
      assetName: "assets/svgs/ic_logout.svg",
    )
  ];



  int _currentMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Color(0xff010101),
      appBar: AppBar(
        brightness: Brightness.dark,
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
                    child: _buildListMenu(_listMenu),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeScreen(),
          FavoritesScreen(),
          RecentlyScreen(),
          SettingsScreen(),
          AboutScreen(),
          HelpScreen()
        ],
      )
    );
  }
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildHeaderDrawer() {
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
                      backgroundImage:
                      ExactAssetImage("assets/images/ic_avatar.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
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
                        width: double.infinity,
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

  Widget _buildRowMenu(
      MenuObject menuObject, bool isActive, VoidCallback callback) {
    return Column(
      children: [
        FlatButton(
          padding: EdgeInsets.zero,
          onPressed: callback,
          child: Row(
            children: [
              Container(
                height: 17,
                width: 3,
                color: isActive ? AppColors.colorActive : Colors.transparent,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: 30,
                width: 30,
                child: SvgPicture.asset(
                  menuObject.assetName,
                  color: isActive
                      ? AppColors.colorActive
                      : AppColors.colorUnActive,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                menuObject.menuName,
                style: TextStyle(
                  fontSize: 14,
                  color: isActive
                      ? AppColors.colorActive
                      : AppColors.colorUnActive,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _buildListMenu(List<MenuObject> list) {
    return ListView.builder(
      // scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (BuildContext context, int index) {
          var obj = list[index];
          return _buildRowMenu(obj, index == _currentMenuIndex, () {
            if(index == 6){
              Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => SigninScreen()));
            }else{
              _pageController.jumpToPage(index);
              Navigator.pop(context);
            }
            setState(() {
              _currentMenuIndex = index;
            });
          });
        });
  }
}

