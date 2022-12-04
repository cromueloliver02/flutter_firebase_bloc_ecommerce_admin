import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';

class HomePage extends StatelessWidget {
  static const id = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce Admin App'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => Get.to(() => ProductPage()),
                child: const Card(
                  child: Center(child: Text('Go to Products')),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => Get.to(() => OrdersPage()),
                child: const Card(
                  child: Center(child: Text('Go to Orders')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
