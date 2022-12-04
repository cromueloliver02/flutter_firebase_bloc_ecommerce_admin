import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart' as model;
import '../models/models.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<OrderStats>> getOrderStats() {
    return firestore.collection('order_stats').orderBy('dateTime').get().then(
        (querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => OrderStats.fromDoc(entry.value, entry.key))
            .toList());
  }

  Stream<List<model.Order>> getOrders() {
    return firestore.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => model.Order.fromDoc(doc)).toList();
    });
  }

  Stream<List<model.Order>> getPendingOrders() {
    return firestore
        .collection('orders')
        .where('isDelivered', isEqualTo: false)
        .where('isCancelled', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => model.Order.fromDoc(doc)).toList();
    });
  }

  Stream<List<model.Product>> getProducts() {
    return firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => model.Product.fromDoc(doc)).toList();
    });
  }

  Future<void> addProduct(model.Product product) {
    return firestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
    model.Product product,
    String field,
    dynamic newValue,
  ) {
    return firestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }

  Future<void> updateOrder(
    model.Order order,
    String field,
    dynamic newValue,
  ) {
    return firestore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.first.reference.update({field: newValue})
            });
  }
}
