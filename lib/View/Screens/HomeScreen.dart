import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wea_app/cubit/WeaCubit.dart';
import 'package:wea_app/cubit/WeaStates.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeaCubit, WeaStates>(
      listener: (context, state) {
        if (state is CurrentWeatherErrorDataState) {
          Fluttertoast.showToast(
              msg: 'la 7ilw',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<WeaCubit>(context);
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/clouds.jpg',
                ),
                fit: BoxFit.cover,
              )),
          child: SafeArea(
            child: ConditionalBuilder(
              condition: cubit.weatherData != null,
              fallback: (context) => Center(child: CircularProgressIndicator()),
              builder: (context)=>SafeArea(
                child: Scaffold(
                  body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search_outlined,
                                      color: Colors.teal,
                                    ),
                                    labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15,color: Colors.teal),
                                    label: Text('Enter city'),


                                    border: OutlineInputBorder(),
                                    iconColor: Colors.teal,
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                                  ),
                                  style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15,color: Colors.teal),
                                  cursorColor:Colors.teal,


                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter city';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (city) {
                                    cubit.city = city;
                                    cubit.getCurrentWeatherData(cityName: city);
                                    cubit.getForecastWeaData(cityName: city);
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '${cubit.city.toUpperCase()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 35,color: Colors.teal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${cubit.currentWeaModel!.weather[0].main}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 25,color: Colors.teal),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'H: ${cubit.currentWeaModel!.main!.maxTemp.round()}\u{10d}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(fontSize: 20,color: Colors.teal),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'L: ${cubit.currentWeaModel!.main!.minTemp.round()}\u{10d}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(fontSize: 20,color: Colors.teal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Divider(
                              color: Colors.black,
                              height: 2,
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Center(
                              child: Container(
                                height: 150,
                                child: ListView.separated(
                                  itemCount: cubit.weatherData!.list.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) => SizedBox(
                                    width: 40,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${cubit.time[index]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(fontSize: 20,color: Colors.teal),
                                        ),
                                        Text(
                                          '${cubit.weatherData!.list[index].weather[0].main}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(fontSize: 20,color: Colors.teal),
                                        ),
                                        Text(
                                          '${cubit.weatherData!.list[index].main!.temp.round()}\u{10d} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(fontSize: 20,color: Colors.teal),
                                        )
                                      ],
                                    );
                                  },
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Divider(
                              color: Colors.black,
                              height: 2,
                            ),

                            // Expanded(
                            //   child: ListView.separated(itemCount: cubit.days.length, separatorBuilder: (BuildContext context, int index) =>
                            //       SizedBox(
                            //         height: 10,
                            //       )
                            //     , itemBuilder: (BuildContext context, int index)
                            //   {
                            //     return Row(
                            //       children:
                            //       [
                            //         Expanded(
                            //           child: Row(
                            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //
                            //             children: [
                            //               Text(
                            //                 '${cubit.days[index]}',
                            //                 style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12,),
                            //               ),
                            //               Text(
                            //                 'icons',
                            //                 style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12,),
                            //               ),
                            //               Text(
                            //                 '${cubit.weatherData!.list[index].main}',
                            //                 style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12,),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 5.0,
                            //         ),
                            //         Text(
                            //           'LowDegree',
                            //           style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12,),
                            //         ),
                            //
                            //
                            //       ],
                            //     );
                            //   },
                            //     scrollDirection: Axis.vertical,
                            //
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
