import 'package:dictionary_app/core/colors.dart';
import 'package:http/http.dart' as http;
import '../../model/dictionary_response.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DictionaryHomeService {
  Future<DictionaryResponse?> searchWordMeaning(word) async {
    DictionaryResponse? response;
    String baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en';
    var result = await http.get(Uri.parse('$baseUrl/$word'));
    print('result $result');
    if (result.statusCode == 200) {
      response = dictionaryResponseFromJson(result.body)[0];
      print('response $response');
    } else {
      print('no response');
      response = null;
      Fluttertoast.showToast(
        msg: "The word you've entered isn't in the dictionary",
        backgroundColor: CustomColors.backgroundColor2,
        textColor: CustomColors.backgroundColor1,
      );
    }
    return response;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
