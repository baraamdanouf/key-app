import 'package:flutter/material.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;

  const ShimmerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MainController.themeData.value.dividerColor,
      highlightColor: Colors.grey[200]!,
      child: child,
    );
  }
}
