import 'package:dailyrecipe/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  @override
  _CustomFilterBottomSheetState createState() =>
      _CustomFilterBottomSheetState();
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  final List<String> _listMeal = ["Breakfast", "Brunch", "Lunch", "Dinner"];
  final List<String> _listCourse = [
    "Soup",
    "Appetizer",
    "Starter",
    "Main Dish",
    "Side",
    "Dessert",
    "Drinks"
  ];

  int _currentMealIndex = 0;
  int _currentCourseIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return _buildBottomSheet(_size);
  }

  Widget _buildBottomSheet(Size _size) {
    return Container(
      height: _size.height * 0.9,
      color: Colors.transparent,
      child: new Container(
          decoration: new BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(45.0),
                  topRight: const Radius.circular(45.0))),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Filter",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.colorActive),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 20,
                      right: 20,
                      bottom: 0,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meal",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            _buildListMeal(_listMeal),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Course",
                              style:
                              TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            _buildListCourse(_listCourse),
                            SizedBox(
                              height: 10,
                            ),
                            _buildServing(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildPreTime(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildCalories(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildRateStar(),
                            SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Container(
                        child: FlatButton(
                          onPressed: () => {},
                          height: 50,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "Apply",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _buildRateStar() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rating",
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            child: RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: AppColors.colorActive,
              emptyColor: AppColors.colorActive,
              halfFilledColor: AppColors.colorActive,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalories() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Calories",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Set Manually",
                  style: TextStyle(fontSize: 14, color: AppColors.colorActive),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
        Slider(
          value: 0,
          min: 0,
          max: 100,
          divisions: 5,
          label: 0.round().toString(),
        )
      ],
    );
  }

  Widget _buildPreTime() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Preparation Time",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Set Manually",
                  style: TextStyle(fontSize: 14, color: AppColors.colorActive),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
        Slider(
          value: 0,
          min: 0,
          max: 100,
          divisions: 5,
          label: 0.round().toString(),
        )
      ],
    );
  }

  Widget _buildServing() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Serving",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Set Manually",
                  style: TextStyle(fontSize: 14, color: AppColors.colorActive),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
        Slider(
          value: 0,
          min: 0,
          max: 100,
          divisions: 5,
          label: 0.round().toString(),
        )
      ],
    );
  }

  Widget _buildRowMeal(String menu, bool isActive, VoidCallback callback) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: callback,
      child: Container(
        height: 30,
        width: 88,
        decoration: BoxDecoration(
            color: isActive ? Color(0x128F55A00) : Color(0xFF4A4A4A),
            border: Border.all(
                color: isActive ? AppColors.colorActive : Color(0xFF4A4A4A)),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            menu,
            style: TextStyle(
                fontSize: 12,
                color: isActive ? AppColors.colorActive : Color(0xff727272)),
          ),
        ),
      ),
    );
  }

  Widget _buildListMeal(List<String> list) {
    return GridView.builder(
      itemCount: list.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 5,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        return _buildRowMeal(
          list[index],
          index == _currentMealIndex,
          () {
            setState(() {
              _currentMealIndex = index;
            });
          },
        );
      },
    );
  }

  Widget _buildListCourse(List<String> list) {
    return GridView.builder(
      itemCount: list.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 5,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        return _buildRowMeal(
          list[index],
          index == _currentCourseIndex,
              () {
            setState(() {
              _currentCourseIndex = index;
            });
          },
        );
      },
    );
  }
}
