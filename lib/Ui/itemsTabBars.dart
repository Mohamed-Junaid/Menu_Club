import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/confirmOrder.dart';


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
  List<String> opt = [];
  bool isSelectedQ = false;
  bool isSelectedH = false;
  bool isSelectedF = false;
  String selectedContainer = "";

  int current = 0;
  PageController pageController = PageController();

  bool A = false;

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
                style: GoogleFonts.poppins(
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
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 5.w), // Adjust horizontal spacing

              tabs: items.map((item) {
                return Container(
                  height: 33.h,
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
                    height: 510.h,
                    child: TabBarView(
                      children: [
                        GridView.builder(
                          itemCount: 10,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.1,
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 15
                          ),
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          "assets/image 3 (1).png",
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                              builder: (BuildContext context,
                                                  void Function(void Function())
                                                  setState) {
                                                return Padding(
                                                  padding: EdgeInsets.only(left: 10.w,right: 10.w),
                                                  child: Container(
                                                      width: 222.w,
                                                      height:A==false?384.h:500.h,
                                                      decoration: BoxDecoration( 
                                                        borderRadius: BorderRadius.only(
                                                          topRight:
                                                          Radius.circular(50.r),
                                                          topLeft:
                                                          Radius.circular(50.r),
                                                        ),
                                                        color:Color(0xffff3333),
                                                      ),
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.vertical,
                                                        child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: 20.w,top: 40.h),
                                                                child: Text(
                                                                  "Enter The Quantity",
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize: 20.sp,
                                                                      fontWeight:
                                                                      FontWeight.w500,
                                                                      color: Colors.white
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: 47.w, top: 20.h),
                                                                  child: Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: () {
                                                                          FocusScope.of(context).unfocus();
                                                                          setState(() {
                                                                            selectedContainer = "Q";
                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          width: 40.w,
                                                                          height: 40.h,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: selectedContainer == "Q"
                                                                                ? Colors.black
                                                                                : Colors.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              "Q",
                                                                              style: GoogleFonts.poppins(
                                                                                fontSize: 24.sp,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: Color(0xffff3333),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 57.w,),
                                                                      InkWell(
                                                                        onTap: () {
                                                                          FocusScope.of(context).unfocus();
                                                                          setState(() {
                                                                            selectedContainer = "H";
                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          width: 40.w,
                                                                          height: 40.h,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: selectedContainer == "H"
                                                                                ? Colors.black
                                                                                : Colors.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              "H",
                                                                              style: GoogleFonts.poppins(
                                                                                fontSize: 24.sp,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: Color(0xffff3333),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 57.w,),
                                                                      InkWell(
                                                                        onTap: () {
                                                                          FocusScope.of(context).unfocus();
                                                                          setState(() {
                                                                            selectedContainer = "F";
                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          width: 40.w,
                                                                          height: 40.h,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: selectedContainer == "F"
                                                                                ? Colors.black
                                                                                : Colors.white,
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              "F",
                                                                              style: GoogleFonts.poppins(
                                                                                fontSize: 24.sp,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: Color(0xffff3333),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 28.h,left: 38.w),
                                                                child: Container(
                                                                  width: 257.w,
                                                                  height: 45.h,
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: Colors.white),
                                                                    borderRadius: BorderRadius.circular(10.r),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(width: 9.w),
                                                                      Expanded(
                                                                        child: Padding(
                                                                          padding: EdgeInsets.only(left: 29.w,bottom: 13.h),
                                                                          child: TextFormField(

                                                                            onTap: () {
                                                                              setState((){
                                                                                A=true;
                                                                              });
                                                                            },
                                                                            onTapOutside: (newValue) {
                                                                              setState((){
                                                                                A=false;
                                                                              });
                                                                            },
                                                                            onFieldSubmitted: (newValue) {
                                                                              setState((){
                                                                                A=false;
                                                                              });
                                                                            },
                                                                          // onEditingComplete: () {
                                                                          //   setState((){
                                                                          //     A=false;
                                                                          //   });
                                                                          // },

                                                                            textInputAction: TextInputAction.done,
                                                                            style: TextStyle(color: Colors.white),
                                                                            decoration: InputDecoration(
                                                                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                                                              border: InputBorder.none, // Remove the border
                                                                              fillColor: Color(0xffff3333),
                                                                              hintText: "Enter The Quantity ", // Add placeholder text
                                                                              hintStyle: GoogleFonts.poppins(
                                                                                textStyle: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.sp,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(left: 94.w,top: 63.h),
                                                                child: Container(
                                                                  width: 145.w,
                                                                  height: 41.h,
                                                                  decoration: BoxDecoration(
                                                                      boxShadow: kElevationToShadow[4],
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      color: Colors.white),
                                                                  child:Center(
                                                                    child: Text(
                                                                      "ok",
                                                                      style:GoogleFonts.poppins (
                                                                        fontSize: 20.sp,
                                                                        fontWeight: FontWeight.w600,
                                                                        color:Color(0xffff3333),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ]
                                                        ),
                                                      )
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },



                                      child: Align(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        child: Container(
                                          width: 184.w,
                                          height: 63.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20.r),
                                              bottomLeft: Radius.circular(20),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 9.w, top: 10.h),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Banana Bread",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "\$250",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );

                          },
                        ),
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
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,color: Colors.white
                          )
                      ),
                    ),
                  ),SizedBox(width: 54.w,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ConfirmOrder()));
                    },
                    child: Container(
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
                              left: 32.w,
                            ),
                            child: Text("Continue",
                                style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFF0000))),
                          ),
                        ],
                      ),

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
