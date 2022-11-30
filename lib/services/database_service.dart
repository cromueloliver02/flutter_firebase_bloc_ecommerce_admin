import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return firestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
    Product product,
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
}
