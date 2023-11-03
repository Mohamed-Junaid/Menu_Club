import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Chinese extends StatefulWidget {
  const Chinese({super.key});

  @override
  State<Chinese> createState() => _ChineseState();
}
bool isSelectedQ = false;
bool isSelectedH = false;
bool isSelectedF = false;
String selectedContainer = "";
class _ChineseState extends State<Chinese> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffff3333),
      body:  GridView.builder(
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
                        "assets/image 3 (2).png",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),GestureDetector(
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
                                    height: 384.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight:
                                        Radius.circular(50.r),
                                        topLeft:
                                        Radius.circular(50.r),
                                      ),
                                      color:Color(0xffff3333),
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.w,top: 40.h),
                                            child: Text(
                                              "Enter The Quantity",
                                              style: TextStyle(
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
                                                        textInputAction: TextInputAction.next,
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
                                    )
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child:
                  Align(
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
                              "Chinese",
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
          )
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
