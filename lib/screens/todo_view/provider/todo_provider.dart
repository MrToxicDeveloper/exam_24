import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier{
  String? todo;

  List todoList = [];

  void addData(String work){
    todoList.add(work);
    notifyListeners();
  }

  void delData(int index){
    todoList.removeAt(index);
    notifyListeners();
  }

  Future<void> saveData(String name,String pass) async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    shr.setString('username',name );
    shr.setString('pass',pass );

    notifyListeners();
  }
  Future<Map> readData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    String? name = shr.getString('username');
    String? pass = shr.getString('pass');

    Map m1 = {"username": name,"pass":pass};
    return m1;
    // notifyListeners();
  }
}