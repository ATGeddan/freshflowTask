import 'package:cloud_firestore/cloud_firestore.dart';

class CartRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> cartItemsStream() {
    return firestore.collection('items').snapshots(includeMetadataChanges: true);
  }
}
