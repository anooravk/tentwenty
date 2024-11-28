import 'package:flutter/material.dart';

const double defaultPadding = 16.0;

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.04), borderRadius: const BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}

class CardSkelton extends StatelessWidget {
  const CardSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      child: Column(
        children: [
          Skeleton(height: 150, width: 400),
          SizedBox(height: defaultPadding),
          Skeleton(height: 150, width: 400),
          SizedBox(height: defaultPadding),
          Skeleton(height: 150, width: 400),
          SizedBox(height: defaultPadding),
          Skeleton(height: 150, width: 400),
          SizedBox(height: defaultPadding),
          Skeleton(height: 150, width: 400),
        ],
      ),
    );
  }
}
