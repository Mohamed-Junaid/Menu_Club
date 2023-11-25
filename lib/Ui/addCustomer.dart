import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/selectCustomer.dart';
import 'package:menu_club/bloc/createCustomer/create_customer_bloc.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {

  TextEditingController name=TextEditingController();
  TextEditingController place=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address=TextEditingController();


  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _placeFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameFocusNode.addListener(updateNameFocus);
    _phoneFocusNode.addListener(updatePhoneFocus);
    _placeFocusNode.addListener(updatePlaceFocus);
    _addressFocusNode.addListener(updateAddressFocus);
  }

  @override
  void dispose() {
    _nameFocusNode.removeListener(updateNameFocus);
    _phoneFocusNode.removeListener(updatePhoneFocus);
    _placeFocusNode.removeListener(updatePlaceFocus);
    _addressFocusNode.removeListener(updateAddressFocus);
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _placeFocusNode.dispose();
    _addressFocusNode.dispose();
    name.dispose();
    phone.dispose();
    place.dispose();
    address.dispose();
    super.dispose();
  }

  bool isNameFocused = false;
  bool isPhoneFocused = false;
  bool isPlaceFocused = false;
  bool isAddressFocused = false;

  void updateNameFocus() {
    setState(() {
      isNameFocused = _nameFocusNode.hasFocus;
    });
  }

  void updatePhoneFocus() {
    setState(() {
      isPhoneFocused = _phoneFocusNode.hasFocus;
    });
  }

  void updatePlaceFocus() {
    setState(() {
      isPlaceFocused = _placeFocusNode.hasFocus;
    });
  }

  void updateAddressFocus() {
    setState(() {
      isAddressFocused = _addressFocusNode.hasFocus;
    });
  }

  void _handleTapOutside(BuildContext context) {
    // Unfocus the text fields when tapped outside
    if (_nameFocusNode.hasFocus || _phoneFocusNode.hasFocus || _placeFocusNode.hasFocus || _addressFocusNode.hasFocus) {
      _nameFocusNode.unfocus();
      _phoneFocusNode.unfocus();
      _placeFocusNode.unfocus();
      _addressFocusNode.unfocus();
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap outside to dismiss keyboard
        _handleTapOutside(context);
      },
      child: Scaffold(
        backgroundColor: Color(0xffff3333),
        appBar: AppBar(elevation: 0,
          backgroundColor: Color(0xffff3333),
          leadingWidth: 300.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 22.w, top: 10.h),
            child: Text(
              "Add New customer",
              style: GoogleFonts.poppins(
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
                            padding: EdgeInsets.only(top: 47.h, left: 20.w, right: 19.w),
                            child:Container(

                              width: 257.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isNameFocused ? Color(0xffff3333).withOpacity(1) : Color(0xffff3333),
                                  width: isNameFocused ? 2.0 : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.r),
                              ),

                              child: Row(
                                children: [
                                  AnimatedPadding(padding: isNameFocused ? EdgeInsets.only(left: 15.w) :
                                  EdgeInsets.only(left: 30.w), duration:  Duration(milliseconds: 300)),

                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    transform: Matrix4.translationValues(isNameFocused ? -8 : 0, 0, 0),
                                    child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 300),
                                        opacity: isNameFocused ? 0.0 : 1.0,
                                        child: Icon(Icons.person,  size: 15,
                                          color: Color(0xffff3333),)
                                    ),
                                  ),
                                  SizedBox(width: isNameFocused ? 0 : 5),
                                  Expanded(
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      focusNode: _nameFocusNode,
                                      style: TextStyle(color: Colors.black),
                                      controller: name,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xffff3333),
                                        hintText: "Customer Name",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: isNameFocused ? Colors.grey : Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )



                        ),
              Padding(
                padding: EdgeInsets.only(top: 37.h, left: 20.w, right: 19.w),
                child: Container(
                  width: 257.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isPhoneFocused ? Color(0xffff3333).withOpacity(1) : Color(0xffff3333),
                      width: isPhoneFocused ? 2.0 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    children: [
                      AnimatedPadding(
                        padding: isPhoneFocused ? EdgeInsets.only(left: 15.w) : EdgeInsets.only(left: 30.w),
                        duration: Duration(milliseconds: 300),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        transform: Matrix4.translationValues(isPhoneFocused ? -8 : 0, 0, 0),
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: isPhoneFocused ? 0.0 : 1.0,
                          child: Image.asset(
                            "assets/Vector (2).png",
                            width: 13.w,
                            height: 12.h,
                            color: Color(0xffff3333),
                          ),
                        ),
                      ),
                      SizedBox(width: isPhoneFocused ? 0.w : 5.w),
                      Expanded(
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          focusNode: _phoneFocusNode,
                          style: TextStyle(color: Colors.black),
                          controller: phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xffff3333),
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: isPhoneFocused ? Colors.grey : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
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
                            padding: EdgeInsets.only(top: 37.h, left: 20.w, right: 19.w),
                            child:Container(
                              width: 257.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isPlaceFocused ? Color(0xffff3333).withOpacity(1) : Color(0xffff3333),
                                  width: isPlaceFocused ? 2.0 : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.r),
                              ),

                              child: Row(
                                children: [
                                  AnimatedPadding(padding: isPlaceFocused ? EdgeInsets.only(left: 28.w) :
                                  EdgeInsets.only(left: 30.w), duration:  Duration(milliseconds: 300)),

                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    transform: Matrix4.translationValues(isPlaceFocused ? -8 : 0, 0, 0),
                                    child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 300),
                                        opacity: isPlaceFocused ? 0.0 : 1.0,
                                    ),
                                  ),
                                  SizedBox(width: isPlaceFocused ? 0 : 5),
                                  Expanded(
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      focusNode: _placeFocusNode,
                                      style: TextStyle(color: Colors.black),
                                      controller: place,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xffff3333),
                                        hintText: "Place",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: isPlaceFocused ? Colors.grey : Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )



                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 37.h, left: 20.w, right: 19.w),
                            child:Container(
                              width: 257.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isAddressFocused ? Color(0xffff3333).withOpacity(1) : Color(0xffff3333),
                                  width: isAddressFocused ? 2.0 : 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.r),
                              ),

                              child: Row(
                                children: [
                                  AnimatedPadding(padding: isAddressFocused ? EdgeInsets.only(left: 28.w) :
                                  EdgeInsets.only(left: 30.w), duration:  Duration(milliseconds: 300)),

                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    transform: Matrix4.translationValues(isAddressFocused ? -8 : 0, 0, 0),
                                    child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 300),
                                      opacity: isAddressFocused ? 0.0 : 1.0,
                                    ),
                                  ),
                                  SizedBox(width: isAddressFocused ? 0 : 5),
                                  Expanded(
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      focusNode: _addressFocusNode,
                                      style: TextStyle(color: Colors.black),
                                      controller: address,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xffff3333),
                                        hintText: "Address",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: isAddressFocused ? Colors.grey : Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )



                        ),
                      ],
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(top:72.h, bottom: 55.h),
                    child: BlocListener<CreateCustomerBloc, CreateCustomerState>(
  listener: (context, state) {
      if (state is CreateCustomerBlocLoading) {
        print("loading");
        showDialog(
            context: context,
            builder: (BuildContext a) =>
            const Center(child: CircularProgressIndicator()));
      }
      if (state is CreateCustomerBlocLoaded) {
        Navigator.of(context).pop();

        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SelectCustomer()));
      }

      if (state is CreateCustomerBlocError) {
        Navigator.of(context).pop();
        print("error");
      }

  },
  child: GestureDetector(
      onTap: () =>
      { BlocProvider.of<CreateCustomerBloc>(context).add(FetchCreateCustomer(
        name: name.text,
        place: place.text,
        phone: phone.text
      ))},
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
                    ),
)
                )
              ],
            ),
          ),
        ),


      ),
    );
  }
}
