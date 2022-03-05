import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/core/route_names.dart';
import 'package:freshflowtask/src/providers/auth_state_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final authenticated = ref.read(authStateProvider);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, authenticated ? RouteNames.cart : RouteNames.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Splash screen to an animation with a short delay to ease the user in to the screen push
    return const Scaffold();
  }
}
