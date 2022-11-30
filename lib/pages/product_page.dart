import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductPage extends StatelessWidget {
  static const id = '/products';

  const ProductPage({super.key});

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
            Expanded(
              child: ListView.builder(
                itemCount: Product.products.length,
                itemBuilder: (ctx, idx) => SizedBox(
                  height: 210,
                  child: ProductCard(product: Product.products[idx]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

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
                    title: 'Price',
                    value: product.price,
                    label: '\$${product.price}',
                  ),
                  ProductCardSlider(
                    title: 'Qty.',
                    value: product.price,
                    label: '${product.quantity}',
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

class ProductCardSlider extends StatelessWidget {
  const ProductCardSlider({
    Key? key,
    required this.title,
    required this.value,
    required this.label,
  }) : super(key: key);

  final String title;
  final double value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 175,
          child: Slider(
            value: value,
            min: 0,
            max: 25,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {},
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
