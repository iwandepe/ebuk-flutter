import 'dart:async';

import 'package:ebuk_app/services/service_api.dart';
import 'package:ebuk_app/services/service_locator.dart';
import 'package:scoped_model/scoped_model.dart';

class LibraryViewModel extends Model{
  ApiService apiService = locator<ApiService>();

  String _param = "Hello";

  String get param => _param;

  Future saveData() async {
    setParam("Saving data");
    await apiService.saveData();
    setParam("Data Saved");
  }

  void setParam(String param) {
    this._param = param;
    notifyListeners();
  }
}