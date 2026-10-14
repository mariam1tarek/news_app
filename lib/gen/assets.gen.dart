// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/busniess.png
  AssetGenImage get busniess =>
      const AssetGenImage('assets/images/busniess.png');

  /// File path: assets/images/dark_branding.png
  AssetGenImage get darkBranding =>
      const AssetGenImage('assets/images/dark_branding.png');

  /// File path: assets/images/dark_logo.png
  AssetGenImage get darkLogo =>
      const AssetGenImage('assets/images/dark_logo.png');

  /// File path: assets/images/entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('assets/images/entertainment.png');

  /// File path: assets/images/general.png
  AssetGenImage get general => const AssetGenImage('assets/images/general.png');

  /// File path: assets/images/helth.png
  AssetGenImage get helth => const AssetGenImage('assets/images/helth.png');

  /// File path: assets/images/light_branding.png
  AssetGenImage get lightBranding =>
      const AssetGenImage('assets/images/light_branding.png');

  /// File path: assets/images/light_logo.png
  AssetGenImage get lightLogo =>
      const AssetGenImage('assets/images/light_logo.png');

  /// File path: assets/images/science.png
  AssetGenImage get science => const AssetGenImage('assets/images/science.png');

  /// File path: assets/images/sport.png
  AssetGenImage get sport => const AssetGenImage('assets/images/sport.png');

  /// File path: assets/images/technology.png
  AssetGenImage get technology =>
      const AssetGenImage('assets/images/technology.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    busniess,
    darkBranding,
    darkLogo,
    entertainment,
    general,
    helth,
    lightBranding,
    lightLogo,
    science,
    sport,
    technology,
  ];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
