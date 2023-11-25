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
bool _passwordInVisible = true;
class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(updateEmailFocus);
    _passwordFocusNode.addListener(updatePasswordFocus);
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(updateEmailFocus);
    _passwordFocusNode.removeListener(updatePasswordFocus);
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  void updateEmailFocus() {
    setState(() {
      isEmailFocused = _emailFocusNode.hasFocus;
    });
  }

  void updatePasswordFocus() {
    setState(() {
      isPasswordFocused = _passwordFocusNode.hasFocus;
    });
  }
  void _handleTapOutside(BuildContext context) {
    // Unfocus the text fields when tapped outside
    if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
      _emailFocusNode.unfocus();
      _passwordFocusNode.unfocus();
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
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Padding(
          padding: EdgeInsets.only(top: 472.h, left: 52.w, right: 51.w),
          child:Container(

            width: 257.w,
            height: 45.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: isEmailFocused ? Colors.white : Colors.white.withOpacity(0.5),
                width: isEmailFocused ? 2.0 : 1.0,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),

            child: Row(
              children: [
                AnimatedPadding(padding: isEmailFocused ? EdgeInsets.only(left: 5.w) :
                EdgeInsets.only(left: 15.w), duration:  Duration(milliseconds: 300)),

                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(isEmailFocused ? -8 : 0, 0, 0),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: isEmailFocused ? 0.0 : 1.0,
                      child: Icon(Icons.person, color: Colors.white)
                  ),
                ),
                SizedBox(width: isEmailFocused ? 0 : 8),
                Expanded(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    style: TextStyle(color: Colors.white),
                    controller: email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xffff3333),
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: isEmailFocused ? Colors.white60 : Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
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
                    padding: EdgeInsets.only(top: 25.h, left: 52.w, right: 51.w),
                    child:  Container(
                      width: 257.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isPasswordFocused ? Colors.white : Colors.white.withOpacity(0.5),
                          width: isPasswordFocused ? 2.0 : 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          AnimatedPadding(padding: isPasswordFocused ? EdgeInsets.only(left: 5.w) :
                          EdgeInsets.only(left: 15.w), duration:  Duration(milliseconds: 300)),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            transform: Matrix4.translationValues(isPasswordFocused ? -8 : 0, 0, 0),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: isPasswordFocused ? 0.0 : 1.0,
                              child: Icon(Icons.lock, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: isPasswordFocused ? 0 : 8),
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: _passwordFocusNode,
                              obscureText: _passwordInVisible,
                              style: TextStyle(color: Colors.white),
                              controller: password,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xffff3333),
                                hintText: "Password",
                                hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: isPasswordFocused ? Colors.white60 : Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                suffixIcon: AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: isPasswordFocused ? 1.0 : 0.0,
                                  child: isPasswordFocused
                                      ? IconButton(splashRadius: 1.r,
                                    icon: Icon(
                                      _passwordInVisible ? Icons.visibility_off : Icons.visibility,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordInVisible = !_passwordInVisible;
                                      });
                                    },
                                  )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
      print("Invalid Email or Password");
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

