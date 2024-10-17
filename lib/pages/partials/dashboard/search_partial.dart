// ignore_for_file: must_be_immutable

import 'package:aify/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aify/utils/theme.dart';
import 'package:aify/widgets/partials/dashboard/menu_group.dart';
import 'package:aify/widgets/partials/music_carousel.dart';
import 'package:aify/models/music_model.dart';
import 'package:aify/controllers/creations_controller.dart';
import 'package:aify/controllers/menus_controller.dart';

class SearchPartialPage extends StatelessWidget {
  final MenusController menu = Get.find();
  final CreationsController creations = Get.find();
  SearchPartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: TextFieldWidget(
                  'Search for music',
                  controller: TextEditingController(),
                  prefixIcon: const Icon(Icons.search),
                  backgroundColor: AppTheme.backgroundLightColor,
                  borderColor: Colors.transparent,
                ),
              ),
              Obx(() => DashMenuGroup(
                  title: "You might like",
                  actionName: "See more",
                  action: () {},
                  child: SizedBox(
                          height:
                              creations.might_like.isEmpty ? 100 : 160,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: creations.might_like.isEmpty
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
                                      'Nothing to show right now :(\nBut dont worry, you can keep exploring!',
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
                                        .might_like
                                        .map((music) {
                                      return MusicCarousel(
                                          action: () {},
                                          music: music as MusicModel);
                                    })),
                                  ),
                          ),
                        ))),
              Obx(() => DashMenuGroup(
                  title: "Explore new",
                  actionName: "See more",
                  action: () {},
                  child: SizedBox(
                          height:
                              creations.explore_new.isEmpty ? 100 : 160,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: creations.explore_new.isEmpty
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
                                      'Nothing to show right now :(\nBut dont worry, you can keep exploring!',
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
                                        .explore_new
                                        .map((music) {
                                      return MusicCarousel(
                                          action: () {},
                                          music: music as MusicModel);
                                    })),
                                  ),
                          ),
                        ))),
              Obx(() => DashMenuGroup(
                  title: "Top creator picks",
                  actionName: "See more",
                  action: () {},
                  child: SizedBox(
                          height:
                              creations.creator_picks.isEmpty ? 100 : 160,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: creations.creator_picks.isEmpty
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
                                      'Nothing to show right now :(\nBut dont worry, you can keep exploring!',
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
                                        .creator_picks
                                        .map((music) {
                                      return MusicCarousel(
                                          action: () {},
                                          music: music as MusicModel);
                                    })),
                                  ),
                          ),
                        ))),
              
            ],
          ),
        ),
      ),
    );
  }
}
