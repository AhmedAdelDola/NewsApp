import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/moduals/search%20screen/search.dart';
import 'package:newsapp/observer.dart';
import 'package:newsapp/shared/constant/const.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/state.dart';
import 'package:newsapp/shared/network/local/shared%20helper.dart';
import 'package:newsapp/shared/network/remot/dio.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  Bloc.observer =  MyBlocObserver();
  await sharedhelper.init();
  bool isDark = sharedhelper.getBool(key: 'isDark') ?? false;
  print(isDark);
  runApp( MyApp(isDark));

}

class MyApp extends StatelessWidget {
  final bool isDark ;
  MyApp(this.isDark);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (context) => newscubit()
              ..changemode(shared : isDark)
              ..getbussnisdata()
              ..getsciencesdata()
              ..getsportsdata(),
        child: BlocConsumer<newscubit,newsstates>(
            listener: (context, state) {},
            builder: (BuildContext context, state) {
              var cubit = newscubit.get(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  color: Colors.white,
                elevation: 0.0,
                foregroundColor: Colors.black,

          ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.red,
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                  ),
                  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.red,)
                ),
                darkTheme:ThemeData(
                    appBarTheme: AppBarTheme(
                      color: Colors.black45,
                      elevation: 0.0,
                      foregroundColor: Colors.white,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.black45,
                        selectedItemColor: Colors.red,
                        unselectedItemColor: Colors.grey,
                        type: BottomNavigationBarType.fixed,
                    ),
                    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.red,),
                    scaffoldBackgroundColor: Colors.black45,
                  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))

                ),
                themeMode:cubit.isdark? ThemeMode.dark : ThemeMode.light ,
                home: HomeScreen(),);
              }),
    );
        }
    }

    class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return BlocConsumer<newscubit,newsstates>(
          listener: (context, state) {},
          builder: (BuildContext context, state) {
            var cubit = newscubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('News App'),
                actions: [IconButton(onPressed: () {
                  navigatto(context, search());
                  cubit.search = [] ;

            } , icon: Icon(Icons.search)),
                  IconButton(onPressed: (){
                    cubit.changemode();
                    }, icon: Icon(Icons.brightness_4))],
              ),
              bottomNavigationBar:BottomNavigationBar(
                items: cubit.bottomitem,
                currentIndex: cubit.pageindex,
                onTap: (value) {
                  cubit.changeindex(value);
                  },
              ) ,
              body: cubit.scrrens[cubit.pageindex],
            );
          });
  }
}
