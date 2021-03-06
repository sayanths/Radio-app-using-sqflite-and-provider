import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radio_app/model/base_model.dart';

class WebService {
  Future<BaseModel> getData(Uri url, BaseModel baseModel) async {
    final response = await http.get(url);   
    if (response.statusCode == 200) {
      baseModel.fromJson(json.decode(response.body));
      return baseModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
