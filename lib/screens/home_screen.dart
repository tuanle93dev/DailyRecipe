import 'package:dailyrecipe/objects/menu_obj.dart';
import 'package:dailyrecipe/objects/recipes_obj.dart';
import 'package:dailyrecipe/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rating_bar/rating_bar.dart';

import 'custom_filter_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<RecipesObj> _listToDay = [
    RecipesObj(
        isLike: false,
        type: "Breakfast",
        name: "French Toast with Berries",
        star: 4,
        calor: 120,
        minus: 10,
        servies: 1),
    RecipesObj(
        isLike: false,
        type: "Breakfast",
        name: "Brown Sugar Cinnamon Toast",
        star: 3,
        calor: 200,
        minus: 10,
        servies: 1),
    RecipesObj(
        isLike: false,
        type: "Breakfast",
        name: "French Toast with Berries",
        star: 1,
        calor: 120,
        minus: 10,
        servies: 1),
    RecipesObj(
        isLike: false,
        type: "Breakfast",
        name: "Brown Sugar Cinnamon Toast",
        star: 3.5,
        calor: 160,
        minus: 10,
        servies: 1),
  ];

  void _filterTapped(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return CustomFilterBottomSheet();
        },
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010101),
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                FlatButton(
                  child: SvgPicture.asset("assets/svgs/ic_fillter.svg"),
                  onPressed: () => {_filterTapped(context)},
                  color: Color(0xFF2B2B2B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  height: 40,
                  minWidth: 40,
                  splashColor: Colors.grey,
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _buildTodayHeader(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 220,
                      child: _buildListToday(_listToDay),
                      // child: _buildRowToDay(RecipesObj()),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 1,
                      color: Color(0xFF707070),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    _buildRecommendedHeader(),
                    Container(
                      child: _buildListRecommended(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Today's Fresh Recipes",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }

  Widget _buildRecommendedHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Recommended",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }


  Widget _buildRowToDay(RecipesObj obj) {
    return Container(
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
                    image: AssetImage("assets/images/img_item_today.png"))),
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
                    style: TextStyle(fontSize: 8, color: Color(0xFF128FAE)),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "French Toast with Berries",
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
                  style: TextStyle(fontSize: 8, color: AppColors.colorActive),
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
                            child: SvgPicture.asset("assets/svgs/ic_time.svg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "10 mins",
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFF7B7B7B)),
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
                            child: SvgPicture.asset("assets/svgs/ic_bell.svg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "1 Serving",
                              style: TextStyle(
                                  fontSize: 8, color: Color(0xFF7B7B7B)),
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
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 5,
          );
        },
        physics: BouncingScrollPhysics(),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, index) {
          var obj = list[index];
          return _buildRowToDay(obj);
        });
  }

  Widget _buildRowRecommended() {
    return Wrap(children: [
      Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Container(
            height: 89,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xFF2B2B2B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 45,
                    width: 75,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/img_item_today.png"))),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Breakfast",
                          style:
                              TextStyle(fontSize: 8, color: Color(0xFF128FAE)),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Blueberry Muffins",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
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
                            Row(
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
                                        fontSize: 8, color: Color(0xFF7B7B7B)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
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
                                        fontSize: 8, color: Color(0xFF7B7B7B)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 14,
                  width: 50,
                  child: SvgPicture.asset("assets/svgs/ic_like.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }

  Widget _buildListRecommended() {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 5,
          );
        },
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildRowRecommended();
        });
  }
}
