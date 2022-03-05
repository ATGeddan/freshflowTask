import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/core/route_names.dart';
import 'package:freshflowtask/src/screens/login_screen/login_view_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginViewModel loginViewModel = ref.watch(loginProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Freshflow',
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom > 0 ? 0 : 16),
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await loginViewModel.login();
                        if (result == true) {
                          Navigator.pushReplacementNamed(context, RouteNames.cart);
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                        elevation: 5,
                      ),
                      child: loginViewModel.loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Column(
                  children: [
                    TextField(
                      controller: loginViewModel.emailController,
                      focusNode: loginViewModel.emailNode,
                      autofillHints: const <String>[
                        AutofillHints.email,
                      ],
                      onSubmitted: (_) => loginViewModel.passwordNode.requestFocus(),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: loginViewModel.passwordController,
                      focusNode: loginViewModel.passwordNode,
                      autofillHints: const <String>[
                        AutofillHints.password,
                      ],
                      obscureText: true,
                      onSubmitted: (_) async {
                        final result = await loginViewModel.login();
                        if (result == true) {
                          Navigator.pushReplacementNamed(context, RouteNames.cart);
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    if (loginViewModel.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          loginViewModel.errorMessage!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
