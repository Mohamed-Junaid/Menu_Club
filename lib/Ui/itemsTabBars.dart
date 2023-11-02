import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/items_Tabbars/arabic.dart';
import 'package:menu_club/Ui/items_Tabbars/beverages.dart';
import 'package:menu_club/Ui/items_Tabbars/breads.dart';
import 'package:menu_club/Ui/items_Tabbars/chicken.dart';
import 'package:menu_club/Ui/items_Tabbars/chinese.dart';
import 'package:menu_club/Ui/items_Tabbars/indian.dart';
import 'package:menu_club/Ui/items_Tabbars/labanese.dart';

class ItemsTabBars extends StatefulWidget {
  const ItemsTabBars({Key? key}) : super(key: key);

  @override
  State<ItemsTabBars> createState() => _ItemsTabBarsState();
}

class _ItemsTabBarsState extends State<ItemsTabBars> {
  List<String> items = [
    "Breads",
    "Chicken",
    "Chinese",
    "Beverages",
    "Arabic",
    "Indian",
    "Labanese",
  ];

  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        backgroundColor: Color(0xffff3333),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.h), // Set the preferred height
          child: AppBar(
            backgroundColor: Color(0xffff3333),
            leadingWidth: 300.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 22.w, top: 10.h),
              child: Text(
                "Items",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, bottom: 8.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/Group 226.png',
                    height: 36.h,
                    width: 36.w,
                  ),
                ),
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Color(0xffff3333),
              padding: EdgeInsets.only(left: 10.w),
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(boxShadow: kElevationToShadow[4],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 5.w), // Adjust horizontal spacing

              tabs: items.map((item) {
                return Container(
                  height: 33.h, // Set the desired height
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Center(
                    child: Text(item, style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 0.5,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h,),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w,right: 8.w),
                  child: Container(
                    height: 500.h,
                    child: TabBarView(
                      children: [
                        Breads(),Chicken(),Chinese(),Beverages(),Arabic(),Indian(),Labanese()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.h,left: 25.w),
              child: Row(
                children: [
                  Container(
                    width: 117.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                        color: Color(0xffff3333),border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          "ordered",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,color: Colors.white
                          )
                      ),
                    ),
                  ),SizedBox(width: 54.w,),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[4],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: 145.w,
                    height: 41.h,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 41.w,
                          ),
                          child: Text("Continue",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFF0000))),
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
