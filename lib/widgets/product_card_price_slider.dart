import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCardSlider extends StatelessWidget {
  const ProductCardSlider({
    Key? key,
    required this.index,
    required this.product,
    required this.title,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  final int index;
  final Product product;
  final String title;
  final double value;
  final String label;
  final void Function(double)? onChanged;

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
            onChanged: onChanged,
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
