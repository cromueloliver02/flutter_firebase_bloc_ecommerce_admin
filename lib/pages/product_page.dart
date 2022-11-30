import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../widgets/widgets.dart';
import '../pages/pages.dart';

class ProductPage extends StatelessWidget {
  static const id = '/products';

  ProductPage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                color: Colors.black,
                margin: EdgeInsets.zero,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.to(() => const AddProductPage()),
                      iconSize: 30,
                      color: Colors.white,
                      icon: const Icon(Icons.add_circle),
                    ),
                    const Text(
                      'Add new product',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (ctx, idx) => SizedBox(
                    height: 210,
                    child: ProductCard(
                      index: idx,
                      product: productController.products[idx],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
