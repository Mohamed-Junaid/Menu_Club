import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'editOrder.dart';
class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffff3333),
      body: Column(
        children: [SizedBox(height: 115.h,),
          Container(
              width: 300.w,
              height: 374.h,
              decoration:     BoxDecoration(
                boxShadow: kElevationToShadow[4],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:18.h,left: 85.w),
                  child: Text(
                      "confirm Order",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,color: Colors.black
                      )
                  ),
                ),
                SizedBox(height: 9.h,),
                Divider(
                  color: Colors.black,thickness: 1,
                ),SizedBox(height: 29.h,),
                Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 150.w,
                            child: Text(
                                "Name",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                          Text(
                              ":",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,color: Colors.black
                              )
                          ),SizedBox(width: 5.w),
                          SizedBox(width: 89.w,
                            child: Text(textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "Dmate",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h,),
                      Row(
                        children: [
                          SizedBox(width: 150.w,
                            child: Text(
                                "Phone number",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),

                          Text(
                              ":",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,color: Colors.black
                              )
                          ),SizedBox(width: 5.w),
                          SizedBox(width: 89.w,
                            child: Text(textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "7736312545",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h,),
                      Row(
                        children: [
                          SizedBox(width: 150.w,
                            child: Text(
                                "Number of Person",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                          Text(
                              ":",
                              style: GoogleFonts.poppins(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,color: Colors.black
                              )
                          ),SizedBox(width: 5.w),
                          SizedBox(width: 89.w,
                            child: Text(textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "3",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 33.h,),
                      Row(
                        children: [
                          Text(
                              "Selected item",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,color: Colors.black
                              )
                          ),SizedBox(width: 66.w,),
                          Text(
                              "Quantity",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,color: Colors.black
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        children: [
                          SizedBox(width: 160.w,
                            child: Text(
                                "Chicken 65 (full)",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),

                          SizedBox(width: 60.w,
                            child: Text(
                              textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "1",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.h,),
                      Row(
                        children: [
                          SizedBox(width: 160.w,
                            child: Text(
                                "Chilly Chicken (half)",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),

                          SizedBox(width: 60.w,
                            child: Text(
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "1",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.h,),
                      Row(
                        children: [
                          SizedBox(width: 160.w,
                            child: Text(
                                "Biriyani",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),

                          SizedBox(width: 60.w,
                            child: Text(
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "3",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.h,),
                      Row(
                        children: [
                          SizedBox(width: 160.w,
                            child: Text(
                                "Pepsi(750)ml ",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),

                          SizedBox(width: 60.w,
                            child: Text(
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                                "1",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      Padding(padding: EdgeInsets.only(left: 37.w,top: 139.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> EditOrder()));
            },
            child: Container(
              width: 118.w,
              height: 41.h,
              decoration: BoxDecoration(
                  color: Color(0xffff3333),border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                    "Edit Order",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,color: Colors.white
                    )
                ),
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
              width: 142.w,
              height: 41.h,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 41.w,
                    ),
                    child: Text("confirm",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
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
    );
  }
}
