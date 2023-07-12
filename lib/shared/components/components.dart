import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/moduals/webview/webview.dart';
import 'package:newsapp/shared/constant/const.dart';


Widget itembuilder(List list , context ,bool search) => ConditionalBuilder(
  condition: list.length > 0 ,
  builder:(context) => ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          navigatto(context, web(url: list[index]['url']));
        },
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 120,width: 120,
              child: list[index]['urlToImage'] != null? Image.network(list[index]['urlToImage'],fit: BoxFit.cover) : Center(child: Text('image\n not found',textAlign: TextAlign.center,style: TextStyle(color: Colors.red),))  ,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${list[index]['title']}',style: TextStyle(fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700,
                  ),maxLines: 3,),
                  Text('${list[index]['publishedAt']}',style: TextStyle(color: Colors.grey)),
                ],),
            ),
          )
        ]),
      ) ,
      separatorBuilder: (context, index) => Container(height: 0.1,color: Colors.grey),
      itemCount: list.length) ,
  fallback: (context) => search? Center(child: CircularProgressIndicator()) : Center(child: Text('search is empty')),);









