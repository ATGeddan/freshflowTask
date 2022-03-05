import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/core/route_names.dart';
import 'package:freshflowtask/src/core/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  NavigatorObserver checkFirebaseAnalytics() {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return FirebaseAnalyticsObserver(analytics: analytics);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'FreshFlow',
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[
          checkFirebaseAnalytics(),
        ],
        onGenerateRoute: Router.router,
        initialRoute: RouteNames.splash,
      ),
    );
  }
}
