import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/select_table.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff3333),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
        padding: EdgeInsets.only(top: 472.h, left: 52.w, right: 51.w),
        child: Container(
          width: 257.w,
          height: 45.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5.r)),
          child:
         TextFormField(textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.white),
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            border: InputBorder.none, // Remove the border
            fillColor: Color(0xffff3333),
            hintText: "Username",
            hintStyle: GoogleFonts.poppins(
              textStyle:TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,          ),),
          prefixIcon: Icon(
          Icons.person, color: Colors.white, ),
          ),
        )
    )
        ),
              Padding(
                  padding: EdgeInsets.only(top: 25.h, left: 52.w, right: 51.w),
                  child: Container(
                      width: 257.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5.r)),
                      child:
                      TextFormField(textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          border: InputBorder.none, // Remove the border
                          fillColor: Color(0xffff3333),
                          hintText: "Username",
                          hintStyle: GoogleFonts.poppins(
                            textStyle:GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,        ),),
                          prefixIcon: Icon(
                            Icons.lock, color: Colors.white, ),
                        ),
                      )
                  )
              ),
              Padding(
                padding: EdgeInsets.only(top: 77.h,left: 107.w),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SelectTable()));
                  },
                  child: Container(
                      width: 145.w,
                      height: 41.h,
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 41.w),
                            child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,color: Color(0xffFF0000)
                                )
                            ),
                          ),SizedBox(width: 5.w,),
                          Image.asset(
                            "assets/Layer_1.png",
                            width: 15.001614570617676,
                            height: 14.999448776245117,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[4],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white)
                  ),
                ),
              )
]
    ),
      ),
    );
  }
}
