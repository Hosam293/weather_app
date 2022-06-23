import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wea_app/Controller/DioHelper.dart';
import 'package:wea_app/cubit/WeaCubit.dart';

import 'View/Screens/HomeScreen.dart';

void main() {
  DioHelper.init();
  runApp( MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => WeaCubit()..getCurrentWeatherData()..getForecastWeaData(),)
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
scaffoldBackgroundColor: Colors.transparent,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
            backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
                statusBarColor: Colors.black
          ),
        ),
        textTheme: TextTheme(bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ))
      ),
      themeMode: ThemeMode.light,
      home:  HomeScreen(),
    );
  }
}

