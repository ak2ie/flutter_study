import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/album_edit_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/album.dart';

// 参考：https://blog.pentagon.tokyo/3466/

class AlbumEditPage extends ConsumerStatefulWidget {
  const AlbumEditPage({Key? key, this.args}) : super(key: key);

  final Album? args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AlbumEditPageState();
}

class AlbumEditPageState extends ConsumerState<AlbumEditPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(albumPageNotifierProvider.notifier).setInitState(widget.args);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(
        albumPageNotifierProvider); // ここでwatchすることが重要。ViewModelの状態変化時に自動で再ビルドさせる
    final viewModel = ref.watch(albumPageNotifierProvider.notifier);

    return Scaffold(
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: viewModel.get().title),
              ),
              const TextField()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          heroTag: "btn1",
        ));
  }
}
