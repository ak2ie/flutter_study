import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/screens/about.dart';
import 'package:flutter_application_2/screens/album_edit.dart';
import 'package:flutter_application_2/screens/home.dart';
import 'package:flutter_application_2/screens/login.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository_impl.dart';

class _AuthStateNotifier extends ValueNotifier<User?> {
  _AuthStateNotifier() : super(null);

  void change(User? v) => value = v;
}

final authStateNotifier = _AuthStateNotifier();

// StreamProvider->ValueNotifierへ変換（GoRouterのrefreshListenableに渡すため）
final authValueProvider = StreamProvider<User?>((ref) {
  ref.listenSelf((_, v) => authStateNotifier.change(v.value));
  return ref.read(authProvider).authStateChanges();
  // return FirebaseAuth.instance.authStateChanges();
});

final routerProvider = Provider((ref) {
  final authState = ref.watch(authValueProvider);
  final userState = ref.watch(authUserProvider);

  return GoRouter(
    initialLocation: "/tab/1",
    routes: [
      GoRoute(
        path: "/tab/:index",
        name: "home",
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['index'] ?? '') ?? 0;
          return Home(currentTab: tab);
        },
      ),
      GoRoute(
        path: "/about",
        name: "About",
        builder: (context, state) => const AboutScreen(),
      ),
      GoRoute(
        path: "/edit",
        name: "Edit",
        builder: (context, state) => AlbumEditPage(
          args: state.extra as Album?,
        ),
      ),
      GoRoute(
          path: "/login",
          name: "Login",
          builder: (context, state) => LoginScreen()),
    ],
    refreshListenable: authStateNotifier,
    // https://zenn.dev/flutteruniv_dev/articles/547dbbb7193ddf
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) {
        return null;
      }

      final isStart = state.uri.toString() == "/";

      // FirebaseAuth.instance.currentUser != nullで判断できるらしい
      // https://stackoverflow.com/a/50714618
      final isSignedIn =
          ref.read(authRepositoryImplProvider).currentUser != null;

      if (!isSignedIn) {
        // 未ログインならログイン画面へ転送
        return state.path == "/login" ? null : "/login";
      }
      if (state.matchedLocation == "/login") {
        // ログイン直後の転送先
        return "/tab/1";
      }

      return null;
    },
  );
});
