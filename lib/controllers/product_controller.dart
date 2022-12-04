import 'package:get/get.dart';

import '../models/models.dart';
import '../services/services.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();

  var products = <Product>[].obs;

  var newProduct = {}.obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice({
    required index,
    required Product product,
    required double value,
  }) {
    product.price = value;
    products[index] = product;
  }

  void saveNewProductPrice(Product product, String field, double value) async {
    await database.updateField(product, field, value);
  }

  void saveNewProductQuantity(Product product, String field, int value) {
    database.updateField(product, field, value);
  }

  void updateProductQuantity({
    required index,
    required Product product,
    required int value,
  }) {
    product.quantity = value;
    products[index] = product;
  }
}
