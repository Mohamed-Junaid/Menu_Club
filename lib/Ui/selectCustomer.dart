import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/select_table.dart';
import 'package:menu_club/bloc/selectCustomerBloc/select_customer_bloc.dart';
import 'package:menu_club/repositories/modelClass/selectCustomerModel.dart';
import '../bloc/allCategoriesBloc/all_categories_bloc.dart';
import '../repositories/modelClass/allCategoriesModel.dart';
import 'addCustomer.dart';
import 'itemsTabBars.dart';


class SelectCustomer extends StatefulWidget {
  final String tableNo;

  const SelectCustomer({
    Key? key, required this.tableNo,

  }) : super(key: key);

  @override
  State<SelectCustomer> createState() => _SelectCustomerState();
}
late List<AllCategoriesModel> cat;
late List<SelectCustomerModel> customerModel;
TextEditingController number = TextEditingController();
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
  void initState() {
    BlocProvider.of<SelectCustomerBloc>(context).add(FetchSelectCustomer());

    BlocProvider.of<AllCategoriesBloc>(context).add(FetchAllCategories());


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Un focus keyboard when tapping outside the text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Color(0xffff3333),
          appBar: AppBar(
            backgroundColor: Color(0xffff3333),
            leadingWidth: 250.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 22.w, top: 10.h),
              child: Text(
                "select Customer",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, bottom: 8.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SelectTable()));
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
          body: SingleChildScrollView(
            child: BlocListener<AllCategoriesBloc, AllCategoriesState>(
  listener: (context, state) {

      if (state is AllCategoriesBlocLoaded) {
        cat = BlocProvider.of<AllCategoriesBloc>(context).allCategoriesModel;
        print('Loaded');
      }
  },
  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 103.h, left: 251.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => AddCustomer()));
                          },
                          child: Container(
                            width: 85.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 6.w),
                              child: Row(
                                children: [
                                  Text("+",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFF3C3C))),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text("Add New",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFF3C3C)))
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Text(widget.tableNo,
                        //     style: GoogleFonts.poppins(
                        //         fontSize: 13.sp,
                        //         fontWeight: FontWeight.w600,
                        //         color: Colors.white))
                      ],
                    )),
                Container(
                  height: 391.h,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isStrechedDropDown = !isStrechedDropDown;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 46.h),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 30.w, top: 46.h),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      // Animation duration
                                      height: isStrechedDropDown ? 220.h : 0,
                                      // Adjust the height
                                      width: 311.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: BlocBuilder<SelectCustomerBloc,
                                              SelectCustomerState>(
                                          builder: (context, state) {
                                        if (state is SelectCustomerBlocLoading) {}
                                        if (state is SelectCustomerBlocError) {
                                          return Center(child: Text("Error"));
                                        }

                                        if (state is SelectCustomerBlocLoaded) {
                                          customerModel =
                                              BlocProvider.of<SelectCustomerBloc>(
                                                      context)
                                                  .selectCustomerModel;
                                          return ListView.builder(
                                              padding: EdgeInsets.only(top: 18.h),
                                              itemExtent: 48.h,
                                              shrinkWrap: true,
                                              itemCount: customerModel.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  title: Center(
                                                      child: Text(
                                                          customerModel[index]
                                                              .name
                                                              .toString(),
                                                          style:
                                                              GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                              color: Color(
                                                                  0xff606060),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                          ))),
                                                  onTap: () {
                                                    setState(() {
                                                      groupValue = index;
                                                      title = customerModel[index].name.toString();
                                                      isStrechedDropDown = false;


                                                    });
                                                  },

                                                );
                                              });
                                        } else {
                                          return SizedBox();
                                        }
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 16.h, left: 30.w),
                                  child: GestureDetector(
                                    onTap: toggleDropDown,
                                    // Toggle the dropdown on tap
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      title,
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color(0xffff3333),
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
                                                        Icons
                                                            .arrow_forward_ios_rounded,
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
                        padding: EdgeInsets.only(top: 16.h, left: 30.w),
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
                                child: TextFormField(
                                  controller: number,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    border: InputBorder.none,
                                    // Remove the border
                                    fillColor: Color(0xffff3333),
                                    hintText: "Number of Customers",
                                    // Add placeholder text
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               Padding(
                      padding:
                          EdgeInsets.only(top: 70.h, left: 107.w, bottom: 55.h),
                      child: GestureDetector(
                        onTap: () {
                          // Check if both fields are selected before navigating
                          if (title!="select customer" && number.text.isNotEmpty ) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ItemsTabBars(cat: cat, name: title, number: number.text,
                                  phone: customerModel[groupValue].phone.toString(), tableNo: widget.tableNo, )));
                          } else {
                            // Show a message or handle the case where fields are not selected
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Please select Customer and Number of Customers.'),
                            ));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: kElevationToShadow[4],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          width: 145.w,
                          height: 41.h,
                          child: Center(
                            child: Text("Continue",
                                style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFF0000))),
                          ),
                        ),
                      ))

              ],
            ),
),
          )),
    );
  }

}
