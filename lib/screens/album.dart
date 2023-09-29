import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/album_page_notifier.dart';
import 'package:flutter_application_2/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumPage extends ConsumerWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumState = ref.watch(albumProvider);
    final albumNotifier = ref.watch(albumProvider.notifier);

    return Scaffold(
      body: albumState.when(
        data: (albums) => ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  final router = ref.read(
                      routerProvider); // onTap, onPressedなどの中ではref.watchは使わないこと
                  router.go("/Edit", extra: albums[index]);
                },
                child: Card(
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [Text(albums[index].title.toString())],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                ));
          },
        ),
        error: (error, stackTrace) => Text("エラー！\n${error.toString()}"),
        loading: () => const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => {await albumNotifier.reload()},
        tooltip: 'reload',
        child: const Icon(Icons.add),
      ),
    );
  }
}
