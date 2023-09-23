import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

class FreezedUserPage extends ConsumerWidget {
  const FreezedUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRequest = UserRequest();
    List<User> userList = <User>[];

    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: userRequest.getAllUser(),
        builder: (context, snapshot) {
          userList = snapshot.data ?? <User>[];
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("${userList[index].id}:"),
                        Text(userList[index].username)
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await userRequest.getAllUser();
        },
        tooltip: "refresh",
        child: const Icon(Icons.update),
      ),
    );
  }
}
