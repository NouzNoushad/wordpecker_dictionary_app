import 'package:dictionary_app/dictionary_home/cubit/dictionary_home_cubit.dart';
import 'package:dictionary_app/dictionary_home/screens/dictionary_home.dart';
import 'package:dictionary_app/dictionary_home/service/dictionary_home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: CustomColors.primarySwatch,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => DictionaryHomeCubit(
            dictionaryHomeService: DictionaryHomeService()
          ),
          child: const DictionaryHome(),
        ));
  }
}
