import 'package:dictionary_app/core/colors.dart';
import 'package:dictionary_app/dictionary_home/cubit/dictionary_home_cubit.dart';
import 'package:dictionary_app/dictionary_home/screens/dictionary_search.dart';
import 'package:dictionary_app/dictionary_home/service/dictionary_home_service.dart';
import 'package:dictionary_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryHome extends StatefulWidget {
  const DictionaryHome({super.key});

  @override
  State<DictionaryHome> createState() => _DictionaryHomeState();
}

class _DictionaryHomeState extends State<DictionaryHome>
    with TickerProviderStateMixin {
  late DictionaryHomeCubit homeCubit;
  late TabController tabController;
  @override
  void initState() {
    homeCubit = BlocProvider.of<DictionaryHomeCubit>(context);
    homeCubit.searchWordMeaning();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor1,
      appBar: AppBar(
        title: Text(
          'wordpecker'.capitalize(),
          style: const TextStyle(color: CustomColors.backgroundColor),
        ),
        backgroundColor: CustomColors.backgroundColor1,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: homeCubit.wordController,
                    onSubmitted: (value) {
                      homeCubit.searchWordMeaning();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<DictionaryHomeCubit, DictionaryHomeState>(
              builder: (context, state) {
                return Expanded(
                    child: StreamBuilder(
                  stream: homeCubit.searchStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      tabController = TabController(
                          length: snapshot.data!.meanings.length, vsync: this);
                      print('${snapshot.data!.meanings.length}');
                      return DictionarySearch(
                        snapshot: snapshot.data!,
                        tabController: tabController,
                      );
                    }
                    return const Center(
                      child: Text(
                        'What word do you want to look up?',
                        style: TextStyle(
                            color: Color.fromARGB(144, 167, 130, 149),
                            fontSize: 18),
                      ),
                    );
                  },
                ));
              },
            ),
          ])),
    );
  }
}
