import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_firebase_bloc_ecommerce_admin/controllers/controllers.dart';

import '../widgets/widgets.dart';
import 'pages.dart';

class AddProductPage extends StatelessWidget {
  static const id = '${ProductPage.id}/add';

  AddProductPage({super.key});

  final ProductController productController = Get.find();

  void _pickImage(BuildContext ctx) async {
    final scaffoldMessenger = ScaffoldMessenger.of(ctx);
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      scaffoldMessenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('No image was selected')),
        );
    }

    if (image != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  color: Colors.black,
                  margin: EdgeInsets.zero,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => _pickImage(context),
                        iconSize: 30,
                        color: Colors.white,
                        icon: const Icon(Icons.add_circle),
                      ),
                      const Text(
                        'Add Image',
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
              const SizedBox(height: 20),
              const Text(
                'Profile Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ProductTextField(
                hintText: 'Product ID',
                name: 'id',
                productController: productController,
              ),
              ProductTextField(
                hintText: 'Product Name',
                name: 'name',
                productController: productController,
              ),
              ProductTextField(
                hintText: 'Product Description',
                name: 'description',
                productController: productController,
              ),
              ProductTextField(
                hintText: 'Product Category',
                name: 'category',
                productController: productController,
              ),
              const SizedBox(height: 10),
              AddNewProductSlider(
                label: 'Price',
                name: 'price',
                productController: productController,
                controllerValue: productController.price,
              ),
              AddNewProductSlider(
                label: 'Quantity',
                name: 'quantity',
                productController: productController,
                controllerValue: productController.quantity,
              ),
              const SizedBox(height: 10),
              AddNewProductCheckbox(
                label: 'Recommended',
                name: 'isRecommended',
                productController: productController,
                controllerValue: productController.isRecommended,
              ),
              AddNewProductCheckbox(
                label: 'Popular',
                name: 'isPopular',
                productController: productController,
                controllerValue: productController.isPopular,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print(productController.newProduct);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewProductCheckbox extends StatelessWidget {
  const AddNewProductCheckbox({
    super.key,
    required this.label,
    required this.name,
    required this.productController,
    required this.controllerValue,
  });

  final String label;
  final String name;
  final ProductController productController;
  final bool? controllerValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: controllerValue ?? false,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }
}

class AddNewProductSlider extends StatelessWidget {
  const AddNewProductSlider({
    super.key,
    required this.label,
    required this.name,
    required this.productController,
    this.controllerValue,
  });

  final String label;
  final String name;
  final ProductController productController;
  final double? controllerValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: controllerValue ?? 0,
            min: 0,
            max: 25,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductTextField extends StatelessWidget {
  const ProductTextField({
    super.key,
    required this.hintText,
    required this.name,
    required this.productController,
  });

  final String hintText;
  final String name;
  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct.update(
          name,
          (_) => value,
          ifAbsent: () => value,
        );
      },
    );
  }
}
