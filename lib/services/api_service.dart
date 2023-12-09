import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:showview/models/show_model.dart';
import 'package:xml2json/xml2json.dart';

class ApiService {
  static const String baseUrl =
      "http://kopis.or.kr/openApi/restful/pblprfr?service=4527099df3394a879940a289a1b7d145";
  static const String stdate = "20231209";
  static const String eddate = "20240101";
  static const String cpage = "1";
  static const String rows = "15";

  static Future<List<ShowModel>> getShows() async {
    List<ShowModel> showInstances = [];
    final url = Uri.parse(
        '$baseUrl&stdate=$stdate&eddate=$eddate&cpage=$cpage&rows=$rows');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final xml = response.body; // xml → (string) → json
      final xmlToJson = Xml2Json()..parse(xml);
      final jsonData = xmlToJson.toParker();
      final json = jsonDecode(jsonData);
      final List<dynamic> shows = json["dbs"]["db"];

      for (var show in shows) {
        showInstances.add(ShowModel.fromJson(show));
      }
      return showInstances;
    }
    throw Error();
  }
}
