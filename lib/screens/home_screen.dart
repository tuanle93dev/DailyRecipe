import 'package:dailyrecipe/objects/menu_obj.dart';
import 'package:dailyrecipe/objects/recipes_obj.dart';
import 'package:dailyrecipe/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rating_bar/rating_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  final List<RecipesObj> _listToDay = [
    RecipesObj(isLike:false, type:"Breakfast", name:"French Toast with Berries", star:4, calor:120, minus:10, servies:1),
    RecipesObj(isLike:false, type:"Breakfast", name:"Brown Sugar Cinnamon Toast", star:3, calor:200, minus:10, servies:1),
    RecipesObj(isLike:false, type:"Breakfast", name:"French Toast with Berries", star:1, calor:120, minus:10, servies:1),
    RecipesObj(isLike:false, type:"Breakfast", name:"Brown Sugar Cinnamon Toast", star:3.5, calor:160, minus:10, servies:1),
  ];

  int _currentMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Bonjour, Emma",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xff7B7B7B),
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "What would you like to cook today?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: TextField(
                      style: TextStyle(fontSize: 12, color: Colors.white),
                      cursorColor: AppColors.colorActive,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10, right: 12),
                        border: InputBorder.none,
                        hintText: 'Search for recipes',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Color(0xff7B7B7B)),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFF2B2B2B),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: SvgPicture.asset("assets/svgs/ic_fillter.svg"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Today's Fresh Recipes",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.colorActive,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                       Container(
                         height: 220,
                         child: _buildListToday(_listToDay),
                        // child: _buildRowToDay(RecipesObj()),
                       ),
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
            setState(() {
              _currentMenuIndex = index;
            });
          });
        });
  }

  Widget _buildRowToDay(RecipesObj obj) {
    return  Container(
      width: 170,
      height: 210,
      child: Stack(
        children: [
          Container(
            width: 147,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xFF2B2B2B),
            ),
          ),
          Container(
            width: 18,
            height: 16,
            margin: EdgeInsets.only(top: 15, left: 10),
            child: SvgPicture.asset("assets/svgs/ic_like.svg"),
          ),
          Container(
            width: 144,
            height: 85,
            margin: EdgeInsets.only(top: 15, left: 30),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/img_item_today.png"))),
          ),
          Container(
            width: 144,
            margin: EdgeInsets.only(top: 90),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "Breakfast",
                    style: TextStyle(
                        fontSize: 8, color: Color(0xFF128FAE)),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "French Toast with Berries",
                    style:
                    TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: 50,
                  child: RatingBar.readOnly(
                    initialRating: 3,
                    isHalfAllowed: true,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    size: 10,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "120 Calories",
                  style: TextStyle(
                      fontSize: 8, color: AppColors.colorActive),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            child: SvgPicture.asset(
                                "assets/svgs/ic_time.svg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "10 mins",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xFF7B7B7B)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            child: SvgPicture.asset(
                                "assets/svgs/ic_bell.svg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "1 Serving",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xFF7B7B7B)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListToday(List<RecipesObj> list) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, index) {
          var obj = list[index];
          return _buildRowToDay(obj);
    });
  }
}
