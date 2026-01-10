import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.isVertical = true,
    this.padding = const EdgeInsets.only(left: 10),
    this.physics = const BouncingScrollPhysics(),
    this.controller,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final EdgeInsetsGeometry padding;
  final bool isVertical;
  final ScrollPhysics physics;

  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical ? null : 80,
      child: ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: padding,
        physics: physics,
        controller: controller,
        clipBehavior: Clip.none,
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
