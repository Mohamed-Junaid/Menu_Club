import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/selectCustomer.dart';
import 'package:menu_club/bloc/selectTableBloc/select_table_bloc.dart';
import 'package:menu_club/repositories/modelClass/SelectTableModel.dart';

class SelectTable extends StatefulWidget {
  const SelectTable({Key? key}) : super(key: key);

  @override
  State<SelectTable> createState() => _SelectTableState();
}
late List<SelectTableModel> tableModel;
class _SelectTableState extends State<SelectTable> {
  String selectOption = 'Status';
  List<String> opt = ['Free', 'Preparing', 'Eating', 'Finished'];
  bool isExpanded = false;
  bool isSelected = false;
  bool isTapped = false;
  dynamic groupValue;
  List<bool> isTappedList = List.generate(8, (_) => false);
  void initState() {
    BlocProvider.of<SelectTableBloc>(context).add(FetchSelctTable());
    super.initState();
  }
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
              child: BlocBuilder<SelectTableBloc, SelectTableState>(
  builder: (context, state) {
    if (state is SelectTableBlocLoading) {}
    if (state is SelectTableBlocError) {
      return Center(child: Text("Error"));
    }

    if (state is SelectTableBlocLoaded) {
      tableModel =
          BlocProvider.of<SelectTableBloc>(context).selectTableModel;
      return GridView.builder(
        itemCount:tableModel.length,
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1 / 0.65),
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
        ),
        itemBuilder: (_, index) {
          return Padding(
              padding: EdgeInsets.all(8.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTappedList[index] = !isTappedList[
                    index]; // Toggle the tapped state for the specific container
                  });
                },
                child: Container(
                  width: 151.w,
                  height: 91.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isTappedList[index]
                        ? Colors.black
                        : Colors.white, // Check if it's tapped
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 9.w, top: 4.h),
                        child: Text(
                          "Table ${tableModel[index].tableNo.toString()}",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: isTappedList[index]
                                ? Colors.white
                                : Colors.black, // Change text color
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: Text(
                          "Person ${tableModel[index].id.toString()}",
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(
                                0xff848484), // Change text color
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
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 10.w),
                                          child: Container(
                                            width: 346.w,
                                            height: 341.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.only(
                                                topRight:
                                                Radius.circular(
                                                    50.r),
                                                topLeft:
                                                Radius.circular(
                                                    50.r),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      left: 20.w,
                                                      top: 20.h),
                                                  child: Text(
                                                    "Table ${tableModel[index].tableNo.toString()}",
                                                    style: GoogleFonts
                                                        .poppins(
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                    left: 20.w,
                                                  ),
                                                  child: Text(
                                                    "Person ${tableModel[index].id.toString()}",
                                                    style: GoogleFonts
                                                        .poppins(
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      color: Color(
                                                          0xff848484),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 175.h,
                                                  width:
                                                  double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .only(
                                                            left: 62
                                                                .w,
                                                            top: 15
                                                                .h),
                                                        child:
                                                        Container(
                                                          width: 222.w,
                                                          height: 43.h,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                            color: Color(
                                                                0xffff3333),
                                                          ),
                                                          child:
                                                          InkWell(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                  context)
                                                                  .unfocus();
                                                              isExpanded =
                                                              !isExpanded;
                                                              setState(
                                                                      () {});
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Center(
                                                                  child:
                                                                  Text(
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                    selectOption,
                                                                    style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                      fontSize: 18
                                                                          .sp,
                                                                      fontWeight: FontWeight
                                                                          .w500,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                  1.w,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                  6.w,
                                                                ),
                                                                isExpanded
                                                                    ? Image
                                                                    .asset(
                                                                  'assets/Group 29.png',
                                                                  width: 13.w,
                                                                  height: 13.h,
                                                                )
                                                                    : Image
                                                                    .asset(
                                                                  'assets/Group 28.png',
                                                                  width: 13.w,
                                                                  height: 13.h,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (isExpanded ==
                                                          false)
                                                        SizedBox(
                                                          height: 117.h,
                                                        ),
                                                      if (isExpanded)
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  62.w),
                                                              child:
                                                              Container(
                                                                height:
                                                                85.h,
                                                                width:
                                                                222.w,
                                                                child: ListView
                                                                    .builder(
                                                                  // padding: EdgeInsets.only(top: 18.h),
                                                                    itemExtent: 40
                                                                        .h,
                                                                    shrinkWrap: true,
                                                                    itemCount: opt
                                                                        .length,
                                                                    itemBuilder: (
                                                                        context,
                                                                        index) {
                                                                      return ListTile(
                                                                        title: Center(
                                                                            child: Text(
                                                                                opt
                                                                                    .elementAt(
                                                                                    index),
                                                                                style: GoogleFonts
                                                                                    .poppins(
                                                                                  textStyle: TextStyle(
                                                                                    color: Color(
                                                                                        0xff606060),
                                                                                    fontSize: 16
                                                                                        .sp,
                                                                                    fontWeight: FontWeight
                                                                                        .w400,
                                                                                  ),
                                                                                ))),
                                                                        onTap: () {
                                                                          setState(() {
                                                                            groupValue =
                                                                                index;
                                                                            selectOption =
                                                                            ' Status : ${opt.elementAt(index)}';
                                                                          });
                                                                        },
                                                                      );
                                                                    }),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      left: 101.w,
                                                      bottom: 30.h),
                                                  child: Container(
                                                    width: 145.w,
                                                    height: 41.h,
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          10.r),
                                                      border: Border.all(
                                                          color: Color(
                                                              0xffff3333)),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Save",
                                                        style:
                                                        GoogleFonts
                                                            .poppins(
                                                          fontSize:
                                                          20.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: Color(
                                                              0xffff3333),
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
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 133.w,
                                height: 33.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(5.r),
                                  color: Color(0xffff3333),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 28.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Status",
                                        style: GoogleFonts.poppins(
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
              ));
        },
      );
    } else {
      return SizedBox();
    }
  }
),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 107.w, bottom: 55.h),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SelectCustomer()));
              },
              child: Container(
                  width: 145.w,
                  height: 41.h,
                  child: Center(
                    child: Text("Continue",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFF0000))),
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
