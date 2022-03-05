import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  final String name;
  final double price;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
  });

  factory CartItem.fromSnapshot(QueryDocumentSnapshot snapshot) {
    final Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    return CartItem(
      name: json['name'],
      price: json['price'],
      image: json['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
