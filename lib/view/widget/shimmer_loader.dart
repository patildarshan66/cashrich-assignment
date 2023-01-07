import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/custom_dimensions.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: spacing_xxl_2,vertical: spacing_m),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 100,
    );
  }
}
