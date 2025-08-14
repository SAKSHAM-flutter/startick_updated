import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.source,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.color,
    this.placeHolder,
    this.radius = 0,
  });

  final String source;
  final BoxFit fit;
  final double? height, width, radius;
  final Color? color;
  final String? placeHolder;

  @override
  Widget build(BuildContext context) {
    bool isWeb = source.startsWith('http') ||
        source.startsWith('https') ||
        source.startsWith('www.');
    bool isAsset = source.startsWith('assets');
    return ClipRRect(
      borderRadius:
          radius != null ? BorderRadius.circular(radius!) : BorderRadius.zero,
      child: isWeb
          ? CachedNetworkImage(
              imageUrl: source,
              fit: fit,
              color: color,
              height: height,
              width: width,
              placeholder: (c, z) {
                if (placeHolder == null) {
                  return ShimmerIndicator(
                    isLoading: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(radius ?? 0),
                      ),
                      height: height,
                      width: width,
                    ),
                  );
                } else {
                  return Image.asset(
                    placeHolder!,
                    fit: fit,
                    color: color,
                    height: height,
                    width: width,
                    errorBuilder: (ctx, object, stack) => errorWidget(),
                  );
                }
              },
              errorWidget: (ctx, object, stack) => errorWidget(),
            )
          : isAsset
              ? Image.asset(
                  source,
                  fit: fit,
                  color: color,
                  height: height,
                  width: width,
                  errorBuilder: (ctx, object, stack) => errorWidget(),
                )
              : Image.file(
                  File(source),
                  fit: fit,
                  color: color,
                  height: height,
                  width: width,
                  errorBuilder: (ctx, object, stack) => errorWidget(),
                ),
    );
  }

  Widget errorWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        'assets/no_image.jpeg',
        fit: BoxFit.fill,
      ),
    );
  }
}

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
);

class ShimmerIndicator extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Duration duration;

  const ShimmerIndicator(
      {super.key,
      required this.isLoading,
      required this.child,
      this.duration = const Duration(milliseconds: 400)});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }

    return Shimmer(
      gradient: shimmerGradient,
      enabled: isLoading,
      period: duration,
      child: child,
    );
  }
}
