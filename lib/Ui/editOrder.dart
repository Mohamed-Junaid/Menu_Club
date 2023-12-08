import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/itemsTabBars.dart';
import 'package:menu_club/Ui/selectCustomer.dart';

import 'allOrders.dart';
import 'confirmOrder.dart';
class EditOrder extends StatefulWidget {
  final String  name;
  final String  number;
  final String  image;
  final String  phone;
  final String  quantity;
  final String tableNo;
  final List <String> itemName;
  final List <String> itemQuantity;
  final List <double> itemPrice;
  const EditOrder({
    Key? key, required this.name, required this.number, required this.image,
    required this.quantity, required this.itemName, required this.itemQuantity, required this.itemPrice,
    required this.phone, required this.tableNo

  }) : super(key: key);
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

              Center(
                child: Padding(
                  padding: EdgeInsets.only(top:20.h),
                  child: Text(
                      widget.name,
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      )
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top:5.h),
                  child: Text(
                     'Table no. ${widget.tableNo}',
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      )
                  ),
                ),
              ),
        Padding(
          padding:EdgeInsets.only(left: 22.w, top: 5.h),
          child: Text("Ordered Itmes",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
              SizedBox(height: 16.h,),
              Padding(
                padding: EdgeInsets.only(left: 22.w,),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ItemsTabBars(
                        name: widget.name, cat: cat, number: widget.number, phone: widget.phone, tableNo: widget.tableNo,)));
                  },
                  child: Container(
                    width: 95.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
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
                            "Add items",
                            style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF3C3C)
                            )
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 21.h,),
              Container(height: 510.h,
                child: Expanded(
                  child:  ListView.builder(
                      itemExtent: 130.h,
                      itemCount:  widget.itemName.length, // Number of items
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          widget.image ?? '',
                                          fit: BoxFit.cover,
                                          width: 100.w,
                                          height: 99.h,
                                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                            // If there's an error loading the image, display a fallback image
                                            return Image.asset(
                                              "assets/empty.png",
                                              fit: BoxFit.cover,
                                              width: 100.w,
                                              height: 99.h,
                                            );
                                          },
                                        ),
                                      ),

                                      Container(
                                        width:160.w,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                                              child: Text(
                                                  widget.itemName[index],
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
                                                  widget.itemPrice[index].toString(),
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
                                                        text: widget.itemQuantity[index],
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
                                        ),
                                      ),
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
                                        padding: EdgeInsets.only(left: 15.w, top: 13.h),
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
       padding: EdgeInsets.only(top:20.h,left: 28.w),
       child: Row(
         children: [
           GestureDetector(
             onTap: () {

             },
             child: Container(
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
             ),
           ),SizedBox(width: 54.w,),
           GestureDetector(
             onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (_)=> AllOrders()));
             },
             child: Container(
               decoration: BoxDecoration(
                   boxShadow: kElevationToShadow[4],
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white),
               width: 144.w,
               height: 42.h,
               child: Center(
                 child: Text("Continue",
                     style: GoogleFonts.poppins(
                         fontSize: 20.sp,
                         fontWeight: FontWeight.w600,
                         color: Color(0xffFF0000))),
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
