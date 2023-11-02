import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff3333),
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xffff3333),
        leadingWidth: 300.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 10.h),
          child: Text(
            "Add New customer",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, bottom: 8.h),
            child: GestureDetector(onTap: (){
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
      ),
      body: Padding(
        padding:EdgeInsets.only(top:108.h,left: 32.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 296.w,
                  height: 379.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    boxShadow: kElevationToShadow[4],),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 47.h,left: 20.w,right: 19.w),
                        child: Container(
                        width: 257.w,
                        height: 45.h,
                        decoration: BoxDecoration(color: Colors.white,
                          border:Border.all(color:Color(0xffff3333), ) ,
                            borderRadius: BorderRadius.circular(5)),
                             child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                        padding: EdgeInsets.only(left: 35.w,top: 16.h),
                        child: Icon(
                          Icons.person,
                          size: 15,
                          color: Color(0xffff3333),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: SingleChildScrollView(
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                              border: InputBorder.none, // Remove the border
                              fillColor: Color(0xffff3333),
                              hintText: "Customer Name", // Add placeholder text
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 37.h,left: 20.w,right: 19.w),
                        child: Container(
                          width: 257.w,
                          height: 45.h,
                          decoration: BoxDecoration(color: Colors.white,
                              border:Border.all(color:Color(0xffff3333), ) ,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 35.w,top: 19.h),
                                child: Image.asset(
                                  "assets/Vector (2).png",
                                  width: 15.w,
                                  height: 10.h,
                                )

                                ),
                              SizedBox(width: 5.w),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                      border: InputBorder.none, // Remove the border
                                      fillColor: Color(0xffff3333),
                                      hintText: "Phone Number", // Add placeholder text
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 37.h,left: 20.w,right: 19.w),
                        child: Container(
                          width: 257.w,
                          height: 45.h,
                          decoration: BoxDecoration(color: Colors.white,
                              border:Border.all(color:Color(0xffff3333), ) ,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 28.w),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                      border: InputBorder.none, // Remove the border
                                      fillColor: Color(0xffff3333),
                                      hintText: "Place", // Add placeholder text
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 37.h,left: 20.w,right: 19.w),
                        child: Container(
                          width: 257.w,
                          height: 45.h,
                          decoration: BoxDecoration(color: Colors.white,
                              border:Border.all(color:Color(0xffff3333), ) ,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 28.w),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                      border: InputBorder.none, // Remove the border
                                      fillColor: Color(0xffff3333),
                                      hintText: "Address", // Add placeholder text
                                      hintStyle: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),),
                      )
                    ],
                  ),
              ),
              Padding(
                  padding: EdgeInsets.only(top:72.h, bottom: 55.h),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SelectCustomer()));
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
                              left: 41.w,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:12.w ),
                              child: Text("Save",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFF0000))),
                            ),
                          ),
                        ],
                      ),

                    ),
                  )
              )
            ],
          ),
        ),
      ),


    );
  }
}
