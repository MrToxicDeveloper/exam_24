import 'dart:convert';

import 'package:exam_24/screens/api_view/model/corona_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper{
  Future<CoronaModel> apiCaller() async {
    Uri uri = Uri.parse("https://corona-virus-world-and-india-data.p.rapidapi.com/api");
    var response = await http.get(uri,headers: {"content-type":"application/octet-stream","X-RapidAPI-Key":"a0f85348a8mshb46c481e6ac5541p1cac20jsn984be2cd2605","X-RapidAPI-Host":"corona-virus-world-and-india-data.p.rapidapi.com"});
    var json = jsonDecode(response.body);

    CoronaModel c1 = CoronaModel.fromJson(json);
    return c1;
  }
}