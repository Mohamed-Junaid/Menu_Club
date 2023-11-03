import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class EditOrder extends StatefulWidget {
  const EditOrder({super.key});

  @override
  State<EditOrder> createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xffff3333),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
          padding:EdgeInsets.only(left: 22.w, top: 54.h),
          child: Text("Ordered Itmes",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
              SizedBox(height: 36.h,),
              Padding(
                padding: EdgeInsets.only(left: 22.w,),
                child: Container(
                  width: 88.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child:
                Padding(
                  padding:  EdgeInsets.only(left: 6.w),
                  child: Row(
                    children: [
                      Text(
                          "+",
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFF3C3C)

                          )
                      ),SizedBox(width: 3.w,),
                      Text(
                          "Add Order",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFF3C3C)
                          )
                      )
                    ],
                  ),
                ),
                ),
              ),
              SizedBox(height: 21.h,),
              Container(height: 520.h,
                child: Expanded(
                  child:  ListView.builder(
                      itemExtent: 130.h,
                      itemCount: 10, // Number of items
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                                width: 318.w,
                                height: 99.h,
                                decoration: BoxDecoration(
                                  boxShadow: kElevationToShadow[4],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/image 3 (1).png", fit: BoxFit.cover,
                                          width: 100.w,
                                          height: 99.h,
                                        ),
                                      ),

                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                            child: Text(
                                                "chicken mandi",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.w, top: 2.h),
                                            child: Text(
                                                "Qatar",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                )
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 10.w, top: 2.h),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Quantity : ",
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff898989),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "1",
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors
                                                            .black, // Change the color to your desired color
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )

                                          ),
                                        ],
                                      ), SizedBox(width: 27.w,),
                                      DottedLine(
                                        direction: Axis.vertical,
                                        alignment: WrapAlignment.center,
                                        lineLength: double.infinity,
                                        lineThickness: 2.w,
                                        dashLength: 5.0,
                                        dashColor: Color(0xff898989),
                                        dashRadius: 0.0,
                                        dashGapLength: 4.0,
                                        dashGapGradient: [Colors.white, Colors.white],
                                        dashGapRadius: 0.0,),

                                      Padding(
                                        padding: EdgeInsets.only(left: 25.w, top: 10.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset("assets/Group 110.png",
                                              width: 20.w, height: 20.h,),
                                            Padding(
                                              padding: EdgeInsets.only(top: 30.h),
                                              child: Column(
                                                children: [
                                                  Image.asset("assets/Group 111.png",
                                                    width: 20.w, height: 20.h,),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),),
                          ],
                        );
    }),
                ),
              ),Padding(
       padding: EdgeInsets.only(top:25.h,left: 28.w),
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
                   "Save",
                   style: GoogleFonts.poppins(
                       fontSize: 20.sp,
                       fontWeight: FontWeight.w500,color: Colors.white
                   )
               ),
             ),
           ),SizedBox(width: 54.w,),
           GestureDetector(
             onTap: () {

             },
             child: Container(
               decoration: BoxDecoration(
                   boxShadow: kElevationToShadow[4],
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white),
               width: 144.w,
               height: 42.h,
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

            ]))
    );
  }
}