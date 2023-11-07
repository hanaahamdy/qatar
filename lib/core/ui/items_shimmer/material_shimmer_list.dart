import 'package:flutter/material.dart';

import 'materila_item_shimmer.dart';

class MaterialShimmerWidget extends StatelessWidget {
  const MaterialShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return MaterialItemShimmer();
      },
      itemCount: 5,
    );
  }
}
