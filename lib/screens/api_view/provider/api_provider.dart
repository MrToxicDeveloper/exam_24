import 'package:exam_24/screens/api_view/model/corona_model.dart';
import 'package:exam_24/utils/api_helper/api_helper.dart';
import 'package:flutter/foundation.dart';

class ApiProvider extends ChangeNotifier{
  CoronaModel? coronaModel;
  ApiHelper? apiHelper;

  Future<void> apicaller() async {
    apiHelper = ApiHelper();
    coronaModel = await apiHelper!.apiCaller();
    notifyListeners();
  }
}