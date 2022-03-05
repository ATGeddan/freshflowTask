import 'package:flutter/material.dart';
import 'package:freshflowtask/src/core/route_names.dart';
import 'package:freshflowtask/src/models/cart_item.dart';

class CartItemCell extends StatelessWidget {
  final CartItem item;

  const CartItemCell({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.pushNamed(context, RouteNames.cartItem, arguments: item),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.1),
            )
          ],
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                item.image,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${item.price}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
