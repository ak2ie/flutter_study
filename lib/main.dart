import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/fetch_album.dart';
import 'package:flutter_application_2/models/stub_album_data_source.dart';
import 'package:flutter_application_2/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/album_data_source.dart';

void main() {
  runApp(ProviderScope(
    overrides: [
      dataSourceProvider.overrideWith((ref) => ref.watch(albumDataSouceProvider))
    ],
    child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
