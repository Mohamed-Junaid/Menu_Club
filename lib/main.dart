import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_club/bloc/allCategoriesBloc/all_categories_bloc.dart';
import 'package:menu_club/bloc/login_Bloc/login_bloc.dart';
import 'package:menu_club/bloc/productsBloc/products_bloc.dart';
import 'package:menu_club/bloc/selectCustomerBloc/select_customer_bloc.dart';
import 'package:menu_club/bloc/selectTableBloc/select_table_bloc.dart';
import 'package:menu_club/repositories/modelClass/productsModel.dart';
import 'Ui/loginPage.dart';


const String basePath = 'http://178.18.254.224:9000';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(375,812),minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
      return MultiBlocProvider(

        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => SelectTableBloc()),
          BlocProvider(create: (context) => SelectCustomerBloc()),
          BlocProvider(create: (context) => AllCategoriesBloc()),
          BlocProvider(create: (context) => ProductsBloc()),

        ],
        child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a blue toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              home: LoginPage(),
            ),
      );
        });
  }
}

