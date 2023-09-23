import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/album_page_notifier.dart';
import 'package:flutter_application_2/models/fetch_album.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumPage extends ConsumerWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumState = ref.watch(albumProvider);
    final albumNotifier = ref.watch(albumProvider.notifier);

    return Scaffold(
      body: ListView.builder(
        itemCount: albumState.list.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [Text(albumState.list[index].title)],
              )
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {albumNotifier.reload()},
        tooltip: 'reload',
        child: const Icon(Icons.add),
      ),
    );
  }
}
