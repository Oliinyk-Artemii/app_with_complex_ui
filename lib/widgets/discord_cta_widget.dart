import 'package:complex_ui/utils/values/colors.dart';
import 'package:complex_ui/utils/values/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DiscordCtaWidget extends StatelessWidget {
  const DiscordCtaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0),
      constraints: const BoxConstraints(maxHeight: 500),
      child: Column(
        children: [
          Assets.images.gifs.verification.image(),
          Text(
            'check_back_soon_text'.tr(),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 22.0,
                  color: whiteColor,
                ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
            child: Text(
              'in_the_meantime_join_our_discord'.tr(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 13.0,
                    color: discordCaptionColor,
                  ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(56.0)),
            child: Center(
              child: GestureDetector(
                // ignore: avoid_print
                onTap: () => print('button was pressed'),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0.5),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor,
                            roundedGradientBlackColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(56.0)),
                      ),
                      child: Container(
                        color: blackColor,
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 56.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                primaryColor.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: whiteColor.withOpacity(0.15),
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: const Offset(0.0, 2.0),
                              ),
                              BoxShadow(
                                color: whiteColor.withOpacity(0.05),
                                blurRadius: 80.0,
                                spreadRadius: 0.0,
                                offset: const Offset(0.0, 0.0),
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(56.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 9.0),
                                child: Assets.images.icons.discord.svg(),
                              ),
                              Text(
                                'join_metaview_discord'.tr(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.button,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
