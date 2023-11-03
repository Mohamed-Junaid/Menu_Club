import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CardWidget.dart';
import 'addCustomer.dart';
import 'itemsTabBars.dart';
class SelectCustomer extends StatefulWidget {
  const SelectCustomer({Key? key}) : super(key: key);

  @override
  State<SelectCustomer> createState() => _SelectCustomerState();
}
List <String> _list =['Tbl 1 vimal',"Tbl 2 vimal","Tbl 3 vimal",'Tbl 4 vimal',"Tbl 5 vimal"];
class _SelectCustomerState extends State<SelectCustomer> {
  bool isStrechedDropDown = false;
  void toggleDropDown() {
    setState(() {
      isStrechedDropDown = !isStrechedDropDown;
    });
  }
  dynamic groupValue;
  String title = "select customer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff3333),
      appBar: AppBar(
        backgroundColor: Color(0xffff3333),
        leadingWidth: 150.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 10.h),
          child: Text(
            "select Table",
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
      body:SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 103.h,left: 251.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddCustomer()));
                        },
                        child: Container(
                          width: 80.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),child:
                        Padding(
                          padding:  EdgeInsets.only(left: 6.w),
                          child: Row(
                            children: [
                              Text(
                                  "+",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,color: Color(0xffFF3C3C)

                                  )
                              ),SizedBox(width: 3.w,),
                              Text(
                                  "Add New",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,color: Color(0xffFF3C3C)
                                  )
                              )
                            ],
                          ),
                        ),

                        ),
                      ),

                    ],
                  )
              ),
              Container(height: 391.h,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isStrechedDropDown =
                          !isStrechedDropDown;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top:46.h),
                        child:Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w,top: 46.h),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300), // Animation duration
                                    height: isStrechedDropDown ? 220.h : 0, // Adjust the height
                                    width: 311.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Colors.white,
                                    ),
                                    child:  ListView.builder(
                                      padding: EdgeInsets.only(top: 18.h),
                                        itemExtent: 48.h,
                                        shrinkWrap: true,
                                        itemCount: _list.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Center(child: Text(_list.elementAt(index),style:GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Color(0xff606060),fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                              ),))),
                                            onTap: () {
                                              setState(() {
                                                groupValue = index;
                                                title = _list.elementAt(index);
                                              });
                                            },
                                          );
                                        }
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              child: Padding(
                                padding: EdgeInsets.only(top: 16.h, left: 30.w),
                                child: GestureDetector(
                                  onTap: toggleDropDown, // Toggle the dropdown on tap
                                  child: Container(
                                    width: 311.w,
                                    height: 47.h,
                                    decoration: BoxDecoration(
                                      boxShadow: kElevationToShadow[4],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 74.w),
                                                    child: Text(
                                                      title,
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xffff3333),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                Container(
                                                  height: 15.h,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xffff3333),
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                   Icons.arrow_forward_ios_rounded,
                                                      color: Color(0xffff3333),
                                                      size: 8.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 16.h,left: 30.w),
                      child: Container(
                        width: 311.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 35.w),
                              child: Icon(
                                Icons.person,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 9.w),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                    border: InputBorder.none, // Remove the border
                                    fillColor: Color(0xffff3333),
                                    hintText: "Number of Customers", // Add placeholder text
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
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top:70.h,left: 107.w, bottom: 55.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ItemsTabBars()));
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
                            child: Text("Continue",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFF0000))),
                          ),
                        ],
                      ),

                    ),
                  )
              )
            ]),
      ),
    );
  }
}