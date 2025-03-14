import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanami_capital_task/app_core/style/images/assets.gen.dart';

import 'shimmer_widget.dart';

Widget ImageWidget(String? url,
    {double? height,
    double? width,
    fit = BoxFit.cover,
    double radius = 0,
    BorderRadius? borderRadius,
    Color? color}) {
  if (url == null || url.trim().isEmpty) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        child: Container(
          height: height,
          width: width,
          padding: radius > 0 ? EdgeInsets.zero : const EdgeInsets.all(6),
          alignment: Alignment.center,
          child: ImageWidget(
            Assets.images.logo.path,
          ),
        ));
  }
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(radius),
    child: url.contains(".svg") && url.contains("http")
        ? SvgPicture.network(
            url,
            height: height,
            width: width,
            color: color,
          )
        : url.contains(".svg")
            ? SvgPicture.asset(
                url,
                height: height,
                width: width,
                color: color,
              )
            : url.contains("http")
                ? CachedNetworkImage(
                    key: Key("key${Random.secure().nextInt(999999)}"),
                    height: height,
                    width: width,
                    imageUrl: url,
                    color: color,
                    fit: fit,
                    filterQuality: FilterQuality.low,
                    placeholder: (context, url) => Container(
                      height: height,
                      width: width,
                      padding: const EdgeInsets.all(40),
                      child: ShimmerWidget(
                        child: SizedBox(height: height, width: width),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: height,
                      width: width,
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Image.asset(
                        Assets.images.logo.path,
                      ),
                    ),
                  )
                : Image.asset(
                    url,
                    height: height,
                    width: width,
                    fit: fit,
                    color: color,
                  ),
  );
}

class OutlinedAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Function()? onTap;
  const OutlinedAvatar(
      {super.key, required this.imageUrl, required this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.grey.shade200),
        child: ImageWidget(
          imageUrl,
          width: size * 0.9,
          height: size * 0.9,
          radius: size,
        ),
      ),
    );
  }
}
