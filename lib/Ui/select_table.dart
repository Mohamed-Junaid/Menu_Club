import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/selectCustomer.dart';

class SelectTable extends StatefulWidget {
  const SelectTable({Key? key}) : super(key: key);

  @override
  State<SelectTable> createState() => _SelectTableState();
}

class _SelectTableState extends State<SelectTable> {
  final List numbers = List.generate(30, (index) => "Item $index");
  String selectOption = 'Status';
  List<String> opt = ['Free', 'Preparing', 'Eating', 'Finished'];
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff3333),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 46.h),
            child: Text("select Table",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: GridView.builder(
                itemCount: 8,
                shrinkWrap: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (1 / 0.65),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.w,
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Container(
                      width: 151.w,
                      height: 91.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 9.w, top: 4.h),
                            child: Text(
                              "Table $index",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9.w),
                            child: Text(
                              "Person $index",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff848484),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 9.w, top: 9.h, right: 9.w),
                              child: Center(
                                child: GestureDetector(
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
                                            return Container(
                                              width: 346.w,
                                              height: 341.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(50.r),
                                                  topLeft:
                                                      Radius.circular(50.r),
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.w, top: 13.h),
                                                    child: Text(
                                                      "Table $index",
                                                      style: TextStyle(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.w),
                                                    child: Text(
                                                      "Person $index",
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff848484),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 62.w, top: 10.h),
                                                    child: Container(
                                                      width: 222.w,
                                                      height: 43.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color:
                                                            Color(0xffff3333),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 68.w),
                                                        child: InkWell(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            isExpanded =
                                                                !isExpanded;
                                                            setState(() {});
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                ('Status'),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              Text(
                                                                  ':${selectOption}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              SizedBox(
                                                                width: 6.w,
                                                              ),
                                                              Container(
                                                                height: 15.h,
                                                                width: 15.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          1.w),
                                                                ),
                                                                child: Center(
                                                                  child: Icon(
                                                                    isExpanded
                                                                        ? Icons
                                                                            .keyboard_arrow_down
                                                                        : Icons
                                                                            .arrow_forward_ios_rounded,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 8.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if(isExpanded==false)
                                            SizedBox(height:117.h,),
                                            if(isExpanded)
                                                    Column(
                                                      children: [
                                                        Container(height:80.h,
                                                          child: ListView(
                                                            shrinkWrap: true,
                                                            physics: AlwaysScrollableScrollPhysics(),
                                                            children: opt.map((e) =>
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 135.w,top: 5.h),
                                                                  child: InkWell(
                                                                    onTap: (){
                                                                      isExpanded = false ;
                                                                      selectOption = e ;
                                                                      setState(() {

                                                                      });
                                                                    },
                                                                    child:
                                                                    Container(
                                                                          child:
                                                                              InkWell(
                                                                            onTap: () {
                                                                              isExpanded =
                                                                                  false;
                                                                              selectOption =
                                                                                  e;
                                                                              setState(
                                                                                  () {});
                                                                            },
                                                                            child: Text(
                                                                              e,
                                                                              style:
                                                                                  TextStyle(
                                                                                height:
                                                                                    2,
                                                                                fontSize:
                                                                                    18.sp,
                                                                                fontWeight:
                                                                                    FontWeight.w400,
                                                                                color: Color(
                                                                                    0xff848484),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                ))
                                                                .toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                  if(isExpanded)
                                                    SizedBox(height: 45.h,),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 101.w,bottom: 55.h
                                                    ),
                                                    child: Container(
                                                      width: 145.w,
                                                      height: 41.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffff3333)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Save",
                                                          style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xffff3333),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 133.w,
                                    height: 33.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffff3333),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 28.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Status",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Image.asset(
                                            'assets/Group 28.png',
                                            width: 12.w,
                                            height: 12.h,
                                          ),
                                        ],
                                      ),
                                    ),
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 107.w, bottom: 55.h),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SelectCustomer()));
              },
              child: Container(
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
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFF0000))),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[4],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
