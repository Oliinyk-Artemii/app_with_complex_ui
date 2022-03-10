import 'dart:ui';

import 'package:complex_ui/models/playlist/playlist.dart';
import 'package:complex_ui/utils/values/colors.dart';
import 'package:complex_ui/utils/values/gen/assets.gen.dart';
import 'package:complex_ui/widgets/discord_cta_widget.dart';
import 'package:complex_ui/widgets/gradient_text.dart';
import 'package:complex_ui/widgets/playlist_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final List<Playlist> _playlists = [
  Playlist(
    name: 'Smash Stockpile',
    image: Assets.images.smashStockpile.image(),
    playlistColor: primaryColor,
    newVideosCount: 10,
    watchedVieosCount: 15,
    allVideosCount: 30,
  ),
  Playlist(
    name: 'FGC Rumble',
    image: Assets.images.fgcRumble.image(),
    playlistColor: playlistPurpleColor,
    newVideosCount: 18,
    watchedVieosCount: 0,
    allVideosCount: 18,
  ),
  Playlist(
    name: 'Valorant Volume',
    image: Assets.images.valorantVolume.image(),
    playlistColor: playlistRedColor,
    newVideosCount: 21,
    watchedVieosCount: 21,
    allVideosCount: 21,
  ),
];

final GlobalKey _gradientTextkey = GlobalKey();

class HotPage extends HookWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GradientText gradientText = GradientText(
      'trending_today'.tr(),
      // key: _gradientTextkey,
      gradient: const LinearGradient(
        colors: [
          primaryColor,
          secondaryColor,
        ],
      ),
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: whiteColor,
          ),
    );

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  // alignment: AlignmentDirectional.centerEnd,
                  // clipBehavior: Clip.hardEdge,
                  children: [
                    const Positioned(
                      left: 247.0,
                      top: 0.0,
                      bottom: 0.0,
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          '🔥',
                          style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 247.0,
                      top: 0.0,
                      bottom: 0.0,
                      // child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                      // ),
                    ),
                    const Positioned(
                      left: 247.0,
                      top: 0.0,
                      bottom: 0.0,
                      child: Text(
                        ' 🔥',
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    gradientText,
                  ],
                ),
              ),
            ],
          ),
        ),
        PlaylistCardWidget(playlist: _playlists[0]),
        PlaylistCardWidget(playlist: _playlists[1]),
        PlaylistCardWidget(playlist: _playlists[2]),
        const DiscordCtaWidget(),
      ],
    );
  }
}
