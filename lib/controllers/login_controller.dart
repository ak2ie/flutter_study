import 'dart:async';

import 'package:flutter_application_2/repository/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginScreenControllerProvider =
    AsyncNotifierProvider<LoginScreenController, void>(
        LoginScreenController.new);

class LoginScreenController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    final auth = ref.read(authRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => auth.signIn(email: email, password: password));
  }
}
