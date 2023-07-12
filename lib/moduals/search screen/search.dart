import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/state.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var searchkey = TextEditingController();
    return BlocConsumer<newscubit,newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newscubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
                 Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: searchkey,
                validator: (value) {
        if(value.toString().isEmpty){
        return 'search can\'t be Empty';
        }else{
        return null ;
        }
        },
          onChanged: (value){
          newscubit.get(context).getsearcdata(value);
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Search'),
                ),
                labelStyle: TextStyle(backgroundColor: Colors.white,
                  color: Colors.red,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIconColor: Colors.red,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Icon(Icons.search),
                ),
                focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color:Colors.red,
                      style: BorderStyle.solid,
                    )
                ),

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color:Colors.red,
                      style: BorderStyle.solid,
                    )
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color:Colors.red,
                    style: BorderStyle.solid,),
                  gapPadding: 10,
                )),
          style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600
          ),
        ),
              ),
                 Expanded(child: itembuilder(list,context,false)),
            ],
          ),
        );
      },
    );

  }
}
