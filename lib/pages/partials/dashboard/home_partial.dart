// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aify/utils/theme.dart';
import 'package:aify/widgets/partials/dashboard/menu_group.dart';
import 'package:aify/widgets/partials/music_carousel.dart';
import 'package:aify/widgets/partials/music_listview.dart';
import 'package:aify/models/music_model.dart';
import 'package:aify/controllers/creations_controller.dart';
import 'package:aify/controllers/menus_controller.dart';

class HomePartialPage extends StatelessWidget {
  final MenusController menu = Get.find();
  final CreationsController creations = Get.find();
  HomePartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Column(
            children: [
              Obx(() => DashMenuGroup(
                  title: "Now Trending",
                  actionName: "See more",
                  action: () => menu.selected.value = 1,
                  child: SizedBox(
                          height:
                              creations.now_trending.isEmpty ? 100 : 160,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: creations.now_trending.isEmpty
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.backgroundLightColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No trending music found right now :(\nBut dont worry, you can keep exploring!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 16,
                                    children: List<Widget>.from(creations
                                        .now_trending
                                        .map((music) {
                                      return MusicCarousel(
                                          action: () {},
                                          music: music as MusicModel);
                                    })),
                                  ),
                          ),
                        ))),
              Obx(
                () => DashMenuGroup(
                  title: "Your last creations",
                  actionName: "Library",
                  action: () => menu.selected.value = 3,
                  child: creations.my_creations.isEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppTheme.backgroundLightColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: const EdgeInsets.only(top: 16),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              alignment: Alignment.center,
                              child: Text(
                                'You don\'t have any creations yet :(\nCreate something new right now!',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              scrollDirection: Axis.vertical,
                              itemCount: creations.my_creations.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final music =
                                    creations.my_creations[index] as MusicModel;
                                return MusicListView(
                                    onClick: () {}, 
                                    onLike: () => creations.like(music),
                                    liked: music.liked,
                                    music: music);
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
