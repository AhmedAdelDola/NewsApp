
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/moduals/business%20screen/business%20screen.dart';
import 'package:newsapp/moduals/science%20screen/science.dart';
import 'package:newsapp/moduals/sports%20screen/sports.dart';
import 'package:newsapp/shared/cubit/state.dart';
import 'package:newsapp/shared/network/local/shared%20helper.dart';
import 'package:newsapp/shared/network/remot/dio.dart';

class newscubit extends Cubit<newsstates> {
  newscubit() : super(intistate());

  static newscubit get(context) => BlocProvider.of(context);

  int pageindex = 0;
  List scrrens =
  [
    business(),
    sports(),
    science(),
  ];
  List <BottomNavigationBarItem> bottomitem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];

  void changeindex(int index) {
    pageindex = index;
    emit(changebotomnav());
  }

  List<dynamic> bussnis = [];


  void getbussnisdata() {
    emit(getdataloading());
    Diohelper.get(url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '91a6096e07fc4ba0a7e462d38c3ac7a5',
        }).then((value) {
      bussnis = value.data['articles'];
      emit(getdatasucess());
      print(value.data.toString());
    }).catchError((e) {
      print(e);
    });
    emit(getdataerror());
  }

  List<dynamic> sport = [];

  void getsportsdata() {
    emit(getdataloading());
    Diohelper.get(url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sport',
          'apiKey': '91a6096e07fc4ba0a7e462d38c3ac7a5',
        }).then((value) {
      sport = value.data['articles'];
      emit(getdatasucess());
      print(value.data.toString());
    }).catchError((e) {
      print(e);
    });
    emit(getdataerror());
  }

  List<dynamic> sciences = [];

  void getsciencesdata() {
    emit(getdataloading());
    Diohelper.get(url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '91a6096e07fc4ba0a7e462d38c3ac7a5',
        }).then((value) {
      sciences = value.data['articles'];
      emit(getdatasucess());
      print(value.data.toString());
    }).catchError((e) {
      print(e);
    });
    emit(getdataerror());
  }

  bool isdark = false;

  void changemode({bool? shared}) {
    if (shared != null) {
        isdark = shared ;
        emit(changemodestate());
    }else{
      isdark = !isdark;
      sharedhelper.putbool(key: 'isDark', value: isdark).then((value) {
        emit(changemodestate());
      });
    }
  }
  List<dynamic> search = [];
  void getsearcdata(String value) {
    emit(getsearchloading());
    Diohelper.get(url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '91a6096e07fc4ba0a7e462d38c3ac7a5',
        }).then((value) {
      search = value.data['articles'];
      emit(getsearchsucess());
      print(value.data.toString());
    }).catchError((e) {
      print(e);
    });
    emit(getsearcherror());
  }

}