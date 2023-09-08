import 'package:flutter/material.dart';
import 'package:tiktok_hackers/theme/colors.dart';

class VideoPlayerBackground extends StatelessWidget {
  final String img;
  const VideoPlayerBackground({
    Key? key,
    required this.size,
    required this.img,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: black,
        )
        // image: DecorationImage(
        //     image: NetworkImage(
        //         img),
        //     fit: BoxFit.cover)),
        );
  }
}
