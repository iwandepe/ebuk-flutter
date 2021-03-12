import 'package:ebuk_app/services/service_api.dart';
import 'package:ebuk_app/viewmodel/library_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {

  // register services
  locator.registerLazySingleton<ApiService>(() => ApiService());

  // register models
  locator.registerFactory<LibraryViewModel>(() => LibraryViewModel());
}