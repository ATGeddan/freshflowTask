import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/core/route_names.dart';
import 'package:freshflowtask/src/helpers/locator.dart';
import 'package:freshflowtask/src/network/auth_repo.dart';
import 'package:freshflowtask/src/screens/cart_screen/cart_view_model.dart';
import 'package:freshflowtask/src/screens/cart_screen/widgets/cart_item_cell.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CartViewModel cartViewModel = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () async {
              ref.read(cartProvider).cancelStream();
              await locator<AuthRepo>().logout();
              Navigator.pushReplacementNamed(context, RouteNames.login);
            },
            icon: const Icon(
              Icons.logout,
              size: 25,
            ),
          ),
        ],
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CartItemCell(item: cartViewModel.items[index]);
        },
        itemCount: cartViewModel.items.length,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
