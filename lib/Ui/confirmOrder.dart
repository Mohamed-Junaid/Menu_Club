import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/select_table.dart';

import 'allOrders.dart';
import 'editOrder.dart';
class ConfirmOrder extends StatefulWidget {
  final String  name;
  final String  number;
  final String  phone;
  final String  quantity;
  final List <String> itemName;
  final List <String> itemQuantity;
  final List <double> itemPrice;
  const ConfirmOrder({
    Key? key, required this.name, required this.number, required this.phone,
    required this.quantity, required this.itemName, required this.itemQuantity, required this.itemPrice

  }) : super(key: key);
  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (int i = 0; i < widget.itemPrice.length; i++) {
      totalPrice += widget.itemPrice[i];
    }
    return totalPrice;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffff3333),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 115.h,),
            Container(
                width: 300.w,
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
                                  widget.name,
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
                              child: Text(
                                textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  widget.phone,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,color: Colors.black
                                  ),

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
                                  widget.number,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,color: Colors.black
                                  )
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 30.h,),
                        Row(
                          children: [
                            Text(
                                "Selected item",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,color: Colors.black
                                )
                            ),SizedBox(width: 96.w,),
                            Text(
                                "Quantity",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,color: Colors.black
                                )
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h * widget.itemName.length ,
                          child: ListView.separated(
                              itemCount: widget.itemName.length,
                            physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(top: 8.h,bottom: 10.h),
                              itemBuilder: (context, index) {
                                return Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width:200.w,
                                      child: Text(
                                         widget.itemName[index],
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,color: Colors.black
                                          )
                                      ),
                                    ),
                                Container(width:50.w,
                                  child: Column(
                                    children: [
                                      Text(
                                          widget.itemQuantity[index],
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,color: Colors.black
                                      )
                                      ),

                                    ],
                                  ),
                                ),
                                  ],
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height: 5.h,); },),
                        ),


                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 150.w,top: 30.h,bottom: 30.h),
                    child: Text(
                        'Total:  ${calculateTotalPrice().toStringAsFixed(2)}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        )
                    ),
                  ),
                ],
              ),
            ),

        Padding(padding: EdgeInsets.only(left: 37.w,top: 139.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> EditOrder()));
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
                      style: GoogleFonts.poppins(
                          fontSize: 18.999.sp,
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
                width: 142.w,
                height: 41.h,
                child: Center(
                  child: Text("confirm",
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
          ],
        ),
      ),
    );
  }
}
