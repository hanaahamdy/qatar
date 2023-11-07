import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final double  radius;

  const CircleImage( {Key? key, required this.url, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(
            url),
      ),
    );
  }
}