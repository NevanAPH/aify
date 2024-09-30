import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:aify/utils/theme.dart';
import 'package:aify/controllers/menus_controller.dart';
import 'package:aify/pages/partials/dashboard/home_partial.dart';

class DashboardPage extends StatelessWidget {
  
  DashboardPage({super.key});

  final MenusController menu = Get.find();
  final List<Widget> _pages = [HomePartialPage()];

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    menu.selected.listen((value) {
      if (menu.locked.value) return;
      controller.animateToPage(value,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset('assets/images/backgrounds/main.png',
              width: Get.width, fit: BoxFit.contain),
          PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: _pages),
          
        ],
      ),

      // create bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.backgroundLightColor,
        shape: const CircularNotchedRectangle(),
        height: 80.0,
        notchMargin: 12.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: AppTheme.primaryColorLight, size: 28),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search, color: AppTheme.textPrimaryColor, size: 28),
              onPressed: () {},
            ),
            const SizedBox(width: 64.0),
            IconButton(
              icon: const Icon(Icons.my_library_books, color: AppTheme.textPrimaryColor, size: 28),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: AppTheme.textPrimaryColor, size: 28),
              onPressed: () {},
            ),
          ],
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
            onPressed: () {},
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
