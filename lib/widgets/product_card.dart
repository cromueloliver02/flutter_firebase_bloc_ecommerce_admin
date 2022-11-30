import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../models/models.dart';
import 'widgets.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  final Product product;
  final int index;

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox.square(
                dimension: 80,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductCardSlider(
                    index: index,
                    product: product,
                    title: 'Price',
                    value: product.price,
                    label: '\$${product.price}',
                    onChanged: (value) {
                      productController.updateProductPrice(
                        index: index,
                        product: product,
                        value: value,
                      );
                    },
                    onChangeEnd: (value) {
                      productController.saveNewProductPrice(
                        product,
                        'price',
                        value,
                      );
                    },
                  ),
                  ProductCardSlider(
                    index: index,
                    product: product,
                    title: 'Qty.',
                    value: product.quantity.toDouble(),
                    label: '${product.quantity}',
                    onChanged: (value) {
                      productController.updateProductQuantity(
                        index: index,
                        product: product,
                        value: value.toInt(),
                      );
                    },
                    onChangeEnd: (value) {
                      productController.saveNewProductQuantity(
                        product,
                        'quantity',
                        value.toInt(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
