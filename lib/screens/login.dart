import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/login_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // エラー表示
    ref.listen<AsyncValue>(loginScreenControllerProvider, (_, state) {
      if (!state.isLoading && state.hasError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error.toString())));
      }
    });

    final AsyncValue<void> state = ref.watch(loginScreenControllerProvider);

    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Center(
                    child: Form(
                        key: formKey,
                        child: Column(children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "必須項目です";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Email address"),
                            controller: emailTextController,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Password",
                            ),
                            controller: passwordTextEditingController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "必須項目です";
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await ref
                                    .read(
                                        loginScreenControllerProvider.notifier)
                                    .login(emailTextController.text,
                                        passwordTextEditingController.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("入力内容に誤りがあります")));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 50)),
                            child: state.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("ログイン"),
                          ),
                        ]))))));
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextEditingController.dispose();
  }
}
