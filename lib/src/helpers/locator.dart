import 'package:freshflowtask/src/helpers/event_helper.dart';
import 'package:freshflowtask/src/network/auth_repo.dart';
import 'package:freshflowtask/src/network/cart_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => EventsHelper());
  locator.registerLazySingleton(() => CartRepo());
  locator.registerLazySingleton(() => AuthRepo());
}
