import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/helpers/locator.dart';
import 'package:freshflowtask/src/models/cart_item.dart';
import 'package:freshflowtask/src/network/cart_repo.dart';

final AutoDisposeChangeNotifierProvider<CartViewModel> cartProvider =
    ChangeNotifierProvider.autoDispose<CartViewModel>((ref) => CartViewModel(ref.read));

class CartViewModel extends ChangeNotifier {
  final Reader read;
  final List<CartItem> items = <CartItem>[];
  StreamSubscription? streamSubscription;
  final CartRepo cartRepo = locator<CartRepo>();
  CartViewModel(this.read) {
    listenToCartStream();
  }

  listenToCartStream() {
    streamSubscription =
        cartRepo.cartItemsStream().listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      items.clear();
      items.addAll(
        snapshot.docs.map(
          (QueryDocumentSnapshot snap) => CartItem.fromSnapshot(snap),
        ),
      );
      notifyListeners();
    });
  }

  cancelStream() {
    streamSubscription?.cancel();
    streamSubscription = null;
  }
}
