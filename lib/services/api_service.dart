import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:showview/models/show_detail_model.dart';
import 'package:showview/models/show_model.dart';
import 'package:xml2json/xml2json.dart';

class ApiService {
  static const String key = "4527099df3394a879940a289a1b7d145";
  static const String listUrl =
      "http://kopis.or.kr/openApi/restful/pblprfr?service=$key";
  static const String startDate = "20231209";
  static const String endDate = "20240101";
  static const String page = "1";
  static const String rows = "15";
  static const String detailUrl = "http://kopis.or.kr/openApi/restful/pblprfr/";

  // 리스트
  static Future<List<ShowModel>> getShows(genre) async {
    List<ShowModel> showInstances = [];
    final url = Uri.parse(
        '$listUrl&stdate=$startDate&eddate=$endDate&cpage=$page&rows=$rows&shcate=$genre');
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

  // 상세
  static Future<ShowDetailModel> getShowById(String id) async {
    final url = Uri.parse('$detailUrl$id?service=$key');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final xml = response.body; // xml → (string) → json
      final xmlToJson = Xml2Json()..parse(xml);
      final jsonData = xmlToJson.toParker();
      final json = jsonDecode(jsonData);
      final show = json["dbs"]["db"];
      return ShowDetailModel.fromJson(show);
    }
    throw Error();
  }
}
