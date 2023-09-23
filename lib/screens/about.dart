import 'package:flutter/material.dart';
import 'package:flutter_application_2/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_state_manager.dart';

class AboutScreen extends HookConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      TextButton(
          onPressed: () {
            final r = ref.read(routerProvider);
            r.goNamed("home", pathParameters: {"tab": "1"});
            print("aaa");
          },
          child: const Text("ボタン"))
    ]);
  }
}
