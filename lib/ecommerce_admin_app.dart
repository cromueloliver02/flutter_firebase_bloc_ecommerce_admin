import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/pages.dart';

class EcommerceAdminApp extends StatelessWidget {
  const EcommerceAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(
          name: ProductPage.id,
          page: () => ProductPage(),
        ),
        GetPage(
          name: AddProductPage.id,
          page: () => const AddProductPage(),
        ),
        GetPage(
          name: OrdersPage.id,
          page: () => const OrdersPage(),
        ),
      ],
    );
  }
}
