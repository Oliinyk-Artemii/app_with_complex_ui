/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/fgc_rumble.png
  AssetGenImage get fgcRumble =>
      const AssetGenImage('assets/images/fgc_rumble.png');

  $AssetsImagesGifsGen get gifs => const $AssetsImagesGifsGen();
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/smash_stockpile.png
  AssetGenImage get smashStockpile =>
      const AssetGenImage('assets/images/smash_stockpile.png');

  /// File path: assets/images/valorant_volume.png
  AssetGenImage get valorantVolume =>
      const AssetGenImage('assets/images/valorant_volume.png');
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en-US.json
  String get enUS => 'assets/locales/en-US.json';
}

class $AssetsImagesGifsGen {
  const $AssetsImagesGifsGen();

  /// File path: assets/images/gifs/verification.gif
  AssetGenImage get verification =>
      const AssetGenImage('assets/images/gifs/verification.gif');
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/discord.svg
  SvgGenImage get discord =>
      const SvgGenImage('assets/images/icons/discord.svg');

  /// File path: assets/images/icons/discover.svg
  SvgGenImage get discover =>
      const SvgGenImage('assets/images/icons/discover.svg');

  /// File path: assets/images/icons/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/images/icons/eye.svg');

  /// File path: assets/images/icons/hot.svg
  SvgGenImage get hot => const SvgGenImage('assets/images/icons/hot.svg');

  /// File path: assets/images/icons/inbox.svg
  SvgGenImage get inbox => const SvgGenImage('assets/images/icons/inbox.svg');

  /// File path: assets/images/icons/play.svg
  SvgGenImage get play => const SvgGenImage('assets/images/icons/play.svg');

  /// File path: assets/images/icons/watch.svg
  SvgGenImage get watch => const SvgGenImage('assets/images/icons/watch.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
