import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

class ProductHeading extends StatelessWidget {
  const ProductHeading({
    super.key,
    required this.heading,
  });
  final String heading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        heading,
        style: context.titleMedium.copyWith(
          height: .9,
          color: Colors.white,
        ),
      ),
      trailing: Text(
        'Explore more..',
        style: context.bodyMedium.copyWith(
          height: .9,
          color: Colors.white,
        ),
      ),
    );
  }
}
