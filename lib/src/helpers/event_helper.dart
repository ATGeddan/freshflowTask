import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class EventsHelper {
  final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  Future<bool> logEvent({required String name, Map<String, dynamic>? parameters}) {
    try {
      firebaseAnalytics.logEvent(name: name, parameters: parameters);
      return Future<bool>.value(true);
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }
}
