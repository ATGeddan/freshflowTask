import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/helpers/locator.dart';
import 'package:freshflowtask/src/network/auth_repo.dart';

final StateNotifierProvider<AuthStateProvider, bool> authStateProvider =
    StateNotifierProvider<AuthStateProvider, bool>(
        (StateNotifierProviderRef<AuthStateProvider, bool> ref) {
  return AuthStateProvider();
});

class AuthStateProvider extends StateNotifier<bool> {
  AuthRepo get authRepo => locator<AuthRepo>();
  AuthStateProvider([bool? employee]) : super(locator<AuthRepo>().currentAuthStatus());

  listenToAuthChanges() {
    authRepo.authChangeStream().listen((event) {
      state = event != null;
    });
  }
}
