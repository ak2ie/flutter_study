import 'package:flutter_application_2/screens/about.dart';
import 'package:flutter_application_2/screens/home.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider =
    Provider((ref) => GoRouter(initialLocation: "/0", routes: [
          GoRoute(
              path: "/:tab",
              name: "home",
              builder: (context, state) {
                final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
                return Home(currentTab: tab);
              },
              ),
          GoRoute(
            path: "/about",
            name: "About",
            builder: (context, state) => const AboutScreen(),
          ),
        ],));
