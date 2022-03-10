import 'dart:ui';

import 'package:complex_ui/models/playlist/playlist.dart';
import 'package:complex_ui/utils/values/colors.dart';
import 'package:complex_ui/utils/values/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlaylistCardWidget extends StatelessWidget {
  final Playlist playlist;

  const PlaylistCardWidget({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration firstInnerDecoration = BoxDecoration(
      color: whiteColor.withOpacity(0.075),
      borderRadius: const BorderRadius.all(Radius.circular(32)),
    );

    final firstGradientBoxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(32)),
      gradient: LinearGradient(
        colors: [
          whiteColor.withOpacity(0.2),
          playlistGradientColor.withOpacity(0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );

    final BoxDecoration secondInnerDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(32)),
      gradient: RadialGradient(
        center: const Alignment(-1, -1),
        colors: [
          playlist.playlistColor,
          playlist.playlistColor.withOpacity(0.0),
        ],
        radius: 1.0,
      ),
    );

    final BoxDecoration secondGradientBoxDecoration = BoxDecoration(
      gradient: RadialGradient(
        center: const Alignment(-1, -1),
        colors: [
          playlist.playlistColor,
          playlist.playlistColor.withOpacity(0.0),
        ],
        radius: 1.0,
      ),
      borderRadius: BorderRadius.circular(32),
    );

    final Widget progressBar = ClipRect(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final bool needToShowFlash =
          (playlist.watchedVieosCount / playlist.allVideosCount) != 0.0 &&
              playlist.watchedVieosCount / playlist.allVideosCount != 1.0;
      return Padding(
        padding: const EdgeInsets.only(top: 17.0, bottom: 14.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (needToShowFlash)
              Positioned(
                left: constraints.maxWidth *
                        playlist.watchedVieosCount /
                        playlist.allVideosCount -
                    3,
                top: -5,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.elliptical(100, 200)),
                          color: whiteColor.withOpacity(0.48)),
                      height: 13.0,
                      width: 6.0,
                    ),
                    Positioned(
                      top: -10,
                      bottom: -10,
                      left: -10,
                      right: -10,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                  // ),
                ),
              ),
            Container(
              height: 4.0,
              width: constraints.maxWidth *
                  playlist.watchedVieosCount /
                  playlist.allVideosCount,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    playlist.watchedVieosCount / playlist.allVideosCount == 1.0
                        ? primaryColor
                        : whiteColor,
                  ],
                  stops: const [
                    0.93,
                    1.0,
                  ],
                ),
              ),
            ),
            Container(
              height: 4.0,
              width: constraints.maxWidth *
                  playlist.watchedVieosCount /
                  playlist.allVideosCount,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    playlist.watchedVieosCount / playlist.allVideosCount == 1.0
                        ? primaryColor
                        : whiteColor,
                  ],
                  stops: const [
                    0.93,
                    1.0,
                  ],
                ),
              ),
            ),
            Container(
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                color: whiteColor.withOpacity(0.1),
              ),
              child: const SizedBox(height: 4.0),
            ),
          ],
        ),
      );
    }));

    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
      child: Stack(
        children: [
          Container(
            decoration: firstGradientBoxDecoration,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: blackColor,
                child: Container(
                  // height: 400,
                  // width: 400,
                  constraints: const BoxConstraints.expand(),
                  decoration: firstInnerDecoration,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        boxShadow: [
                          BoxShadow(
                            color: whiteColor.withOpacity(0.03),
                            spreadRadius: 24.0,
                            offset: const Offset(0.0, 12.0),
                          ),
                          BoxShadow(
                            color: whiteColor.withOpacity(0.05),
                            spreadRadius: 4.0,
                            offset: const Offset(0.0, 2.0),
                          ),
                          BoxShadow(
                            color: playlistDropShadowColor.withOpacity(0.6),
                            spreadRadius: 32.0,
                            offset: const Offset(-8.0, -8.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: secondGradientBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: secondInnerDecoration,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 100.0,
                        left: 12.0,
                        right: 12.0,
                        top: 12.0,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: FittedBox(
                          child: playlist.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 32.0,
            bottom: 71.0,
            child: Container(
              height: 64.0,
              width: 64.0,
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.15),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.4),
                    spreadRadius: 0.0,
                    blurRadius: 16.0,
                    offset: const Offset(0.0, 8.0),
                  ),
                ],
              ),
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: firstPlayDropShadowWhiteColor.withOpacity(0.3),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0.0, 0.0),
                      ),
                      BoxShadow(
                        color: secondPlayDropShadowWhiteColor.withOpacity(0.15),
                        blurRadius: 16.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(
                        left: 13.0,
                        right: 10.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Assets.images.icons.play.svg(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 24.0,
            right: 24.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, top: 15.0),
                  child: Text(
                    playlist.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: whiteColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '+${playlist.newVideosCount} ' + 'new_videos'.tr(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: primaryColor,
                          ),
                    ),
                    Row(
                      children: [
                        Assets.images.icons.eye.svg(),
                        Text(
                          '${playlist.watchedVieosCount}/${playlist.allVideosCount}',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: watchedVideosCountColor),
                        )
                      ],
                    )
                  ],
                ),
                progressBar,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
