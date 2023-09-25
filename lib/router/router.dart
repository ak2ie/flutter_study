import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/screens/about.dart';
import 'package:flutter_application_2/screens/album_edit.dart';
import 'package:flutter_application_2/screens/home.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider =
    Provider((ref) => GoRouter(
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
      ],
    ));
