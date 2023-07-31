import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary_app/dictionary_home/service/dictionary_home_service.dart';
import 'package:flutter/material.dart';

part 'dictionary_home_state.dart';

class DictionaryHomeCubit extends Cubit<DictionaryHomeState> {
  final DictionaryHomeService dictionaryHomeService;
  DictionaryHomeCubit({required this.dictionaryHomeService})
      : super(DictionaryHomeInitial());
  TextEditingController wordController = TextEditingController();
  StreamController searchController = StreamController.broadcast();
  Stream get searchStream => searchController.stream;
  StreamSink get searchSink => searchController.sink;

  Future<void> searchWordMeaning() async {
    String word = wordController.text.trim();
    if (word != '') {
      var result = await dictionaryHomeService.searchWordMeaning(word);
      searchSink.add(result);
    }
  }
}
