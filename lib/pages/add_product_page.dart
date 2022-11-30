import 'package:flutter/material.dart';

import 'pages.dart';

class AddProductPage extends StatelessWidget {
  static const id = '${ProductPage.id}/add';

  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.black,
      ),
    );
  }
}
