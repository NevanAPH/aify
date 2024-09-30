import 'package:aify/models/music_model.dart';
import 'package:aify/utils/datas.dart';
import 'package:aify/utils/theme.dart';
import 'package:aify/widgets/partials/music_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/backgrounds/main.png',
              width: Get.width, fit: BoxFit.contain),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: Get.width),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
                child: Column(
                  children: [
                    // Grouped
                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Now Trending',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(children: [
                                  Text(
                                    'See more',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward,
                                      color: AppTheme.textPrimaryColor)
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          //_shimmerHorizontal(context),
                          SizedBox(
                            height: 180,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 16,
                                children: List<Widget>.from(
                                    now_trending.map((musicData) {
                                  return MusicCarousel(
                                      music: MusicModel.from(musicData));
                                })),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your creations',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(children: [
                                  Text(
                                    'Go to library',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward,
                                      color: AppTheme.textPrimaryColor)
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          //_shimmerHorizontal(context),
                          SizedBox(
                            height: 160,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 16,
                                children: List<Widget>.from(
                                    now_trending.map((musicData) {
                                  return MusicCarousel(
                                      music: MusicModel.from(musicData));
                                })),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),

      // create bottom navigation bar
      bottomNavigationBar: const BottomAppBar(
        color: AppTheme.backgroundLightColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 12.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // create circle floating action button
      floatingActionButton: SizedBox(
        width: 80.0,
        height: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {},
            shape: const CircleBorder(),
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppTheme.secondaryColorDark,
                    AppTheme.primaryColorDark
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset('assets/icons/white/spark.svg'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _shimmerHorizontal(BuildContext context) {
    return SizedBox(
      height: 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Shimmer.fromColors(
          baseColor: AppTheme.backgroundLightColor,
          highlightColor: const Color.fromARGB(255, 23, 23, 56),
          child: Row(
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                width: 300,
                height: 180,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundLightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
