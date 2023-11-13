import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/select_table.dart';
import 'package:menu_club/bloc/login_Bloc/login_bloc.dart';
import 'package:menu_club/repositories/modelClass/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
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
           controller: email,
          decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            border: InputBorder.none, // Remove the border
            fillColor: Color(0xffff3333),
            hintText: "Username",
            hintStyle: GoogleFonts.poppins(
              textStyle:TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,),),
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
                        controller: password,
                        decoration:InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          border: InputBorder.none, // Remove the border
                          fillColor: Color(0xffff3333),
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                            textStyle:GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500, ),),
                          prefixIcon: Icon(
                            Icons.lock, color: Colors.white, ),
                        ),
                      )
                  )
              ),
              Padding(
                padding: EdgeInsets.only(top: 77.h,left: 107.w),
                child: BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginBlocLoading) {
    print("loading");
    showDialog(
    context: context,
    builder: (BuildContext a) =>
    const Center(child: CircularProgressIndicator()));
    }
    if (state is LoginBlocLoaded) {
      Navigator.of(context).pop();
      LoginModel loginModel = BlocProvider.of<LoginBloc>(context).loginModel;
      token(
          loginModel.token!.access.toString());
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => const SelectTable()), (
          route) => false);
    }

    if (state is LoginBlocError) {
    Navigator.of(context).pop();
    print("error");
    }

  },
  child: GestureDetector(
    onTap: () =>
    { BlocProvider.of<LoginBloc>(context).add(FetchLogin(
      email: email.text,
      password: password.text,
    ))},
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
                            width: 15.001614570617676.w,
                            height: 14.999448776245117.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[4],
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white)
                  ),
                ),
),
              )
]
    ),
      ),
    );
  }
}
token(String token,) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("Token", token);
}
@override
void dispose() {
  email.clear();
  password.clear();
}

