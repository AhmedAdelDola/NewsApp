import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/state.dart';

class sports extends StatelessWidget {
  const sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit,newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newscubit.get(context).sport;
        return itembuilder(list,context,true);
      },
    );
  }
}
