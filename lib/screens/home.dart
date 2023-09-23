import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/app_state_manager.dart';
import 'package:flutter_application_2/router/router.dart';
import 'package:flutter_application_2/screens/about.dart';
import 'package:flutter_application_2/screens/album.dart';
import 'package:flutter_application_2/screens/counter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'users.dart';



class Home extends HookConsumerWidget {
  const Home({super.key, required this.currentTab});

  final int currentTab;

  static List<Widget> pages = <Widget>[
    const AboutScreen(),
    const MyHomePage(title: "test"),
    const AlbumPage()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: currentTab,
        onTap: (index) {
          final a = ref.read(routerProvider); // onTap, onPressedなどの中ではref.watchは使わないこと
          a.goNamed("home", pathParameters: {"tab": "$index"});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "book"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "user"),
        ],
      ),
    );
  }
}
