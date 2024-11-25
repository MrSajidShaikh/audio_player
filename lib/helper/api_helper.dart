import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<Map> fetchApi(String value) async {
    String api = "https://saavn.dev/api/search/songs?query=$value";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

Future<Map> fetchPunjabiApi(String value) async {
  String api = "https://saavn.dev/api/search/songs?query=$value";
  Uri uri = Uri.parse(api);
  Response response = await http.get(uri);

  if (response.statusCode == 200) {
    final Map data = jsonDecode(response.body);
    return data;
  } else {
    return {};
  }
}
  Future<Map> fetchTopApi(String value) async {
    String api = "https://saavn.dev/api/search/songs?query=$value";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }

  Future<Map> fetchSearchApi(String value) async {
    String api = "https://saavn.dev/api/search/songs?query=$value";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      return data;
    } else {
      return {};
    }
  }
}
