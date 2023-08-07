import 'package:dictionary_app/dictionary_home/service/dictionary_home_service.dart';
import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../model/dictionary_response.dart';

class DictionarySearch extends StatefulWidget {
  final DictionaryResponse snapshot;
  final TabController tabController;
  const DictionarySearch(
      {super.key, required this.snapshot, required this.tabController});

  @override
  State<DictionarySearch> createState() => _DictionarySearchState();
}

class _DictionarySearchState extends State<DictionarySearch>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Text(
        widget.snapshot.word,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: CustomColors.backgroundColor2),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        height: 30,
        // color: Colors.yellow,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.snapshot.phonetics.length,
                  itemBuilder: (context, index) {
                    var phonetics = widget.snapshot.phonetics[index];
                    if (phonetics.text != null) {
                      return Text(
                        '${phonetics.text} ',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.backgroundColor2),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 40,
        // color: Colors.yellow,
        child: TabBar(
            controller: widget.tabController,
            labelPadding: const EdgeInsets.symmetric(vertical: 8),
            indicatorColor: CustomColors.backgroundColor,
            tabs: List.generate(
                widget.snapshot.meanings.length,
                (index) => Text(
                      widget.snapshot.meanings[index].partOfSpeech.capitalize(),
                    )).toList()),
      ),
      SizedBox(
          height: 600,
          // color: Colors.blue,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: TabBarView(
                  controller: widget.tabController,
                  children: List.generate(
                    widget.snapshot.meanings.length,
                    (index) => Wrap(
                      children: List.generate(
                          widget.snapshot.meanings[index].definitions.length,
                          (defIndex) {
                        var definition = widget
                            .snapshot.meanings[index].definitions[defIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${defIndex + 1}: ${definition.definition}',
                              style: const TextStyle(
                                color: CustomColors.backgroundColor2,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            (definition.example != null)
                                ? Text(
                                    'eg: ${definition.example}',
                                    style: const TextStyle(
                                        color: CustomColors.backgroundColor2,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      }).toList(),
                    ),

                    // ListView.separated(
                    // physics: const ClampingScrollPhysics(),
                    // itemCount:
                    //     widget.snapshot.meanings[index].definitions.length,
                    // separatorBuilder: (context, defIndex) => const SizedBox(
                    //       height: 15,
                    //     ),
                    // itemBuilder: (context, defIndex) {
                    //   var definition = widget
                    //       .snapshot.meanings[index].definitions[defIndex];
                    //   return Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         '${defIndex + 1}: ${definition.definition}',
                    //         style: const TextStyle(
                    //           color: CustomColors.backgroundColor2,
                    //           fontSize: 15,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         height: 6,
                    //       ),
                    //       (definition.example != null)
                    //           ? Text(
                    //               'eg: ${definition.example}',
                    //               style: const TextStyle(
                    //                 color: CustomColors.backgroundColor2,
                    //                 fontSize: 15,
                    //               ),
                    //             )
                    //           : Container(),
                    //     ],
                    //   );
                    // })).toList(),
                  ))))
    ]);
  }
}
