import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:aify/utils/theme.dart';
import 'package:aify/controllers/menus_controller.dart';
import 'package:aify/pages/partials/dashboard/home_partial.dart';
import 'package:aify/pages/partials/dashboard/library_partial.dart';
import 'package:aify/pages/partials/dashboard/profile_partial.dart';
import 'package:aify/pages/partials/dashboard/search_partial.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final MenusController menu = Get.find();
  final controller = PageController();
  final List<Widget> _pages = [
    HomePartialPage(),
    SearchPartialPage(),
    const Scaffold(),
    const LibraryPartialPage(),
    const ProfilePartialPage()
  ];

  @override
  Widget build(BuildContext context) {
    menu.selected.listen((value) {
      if (menu.locked.value) return;
      controller.animateToPage(value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCirc);
    });

    controller.addListener(() {
      menu.locked.value = true;
      menu.selected.value = controller.page!.round();
      menu.locked.value = false;
    });

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset('assets/images/backgrounds/main.png',
              width: Get.width, fit: BoxFit.contain),
          PageView(
            controller: controller,
            children: _pages,
            physics: const NeverScrollableScrollPhysics(),
          ),
          Obx(() => PopScope(
                canPop: !menu.locked.value && menu.selected.value == 0,
                child: const SizedBox(),
                onPopInvokedWithResult: (didPop, result) {
                  if (menu.selected.value != 0 && !menu.locked.value) {
                    menu.setSelected(0);
                  }
                },
              ))
        ],
      ),

      // create bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.backgroundLightColor,
        shape: const CircularNotchedRectangle(),
        height: 80.0,
        notchMargin: 12.0,
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Theme(
          data: ThemeData(splashColor: Colors.transparent),
          child: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: AppTheme.primaryColorLight,
              unselectedItemColor: AppTheme.white90,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 32),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 32),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(), // Empty space for the FAB
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books, size: 32),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 32),
                  label: 'Profile',
                ),
              ],
              currentIndex: menu.selected.value,
              onTap: (index) => menu.selected.value = index,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // create circle floating action button
      floatingActionButton: SizedBox(
        width: 72.0,
        height: 72.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () => menu.selected.value = 2,
            shape: const CircleBorder(),
            child: Container(
              width: 72.0,
              height: 72.0,
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
}
