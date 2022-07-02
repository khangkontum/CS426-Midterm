import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // appBarBuilder: (_, tabsRouter) => PreferredSize(
      //   preferredSize: const Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     centerTitle: true,
      //     leading: const AutoLeadingButton(),
      //   ),
      // ),
      routes: const [
        ProductRoute(),
        CartRoute(),
        VendorRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: const Color(0xFF7203FF),
              icon: const Icon(Icons.grid_view_outlined),
              title: const Text('Browse'),
            ),
            SalomonBottomBarItem(
              selectedColor: const Color(0xFF7203FF),
              icon: const Icon(Icons.shopping_cart_outlined),
              title: const Text('Cart'),
            ),
            SalomonBottomBarItem(
              selectedColor: const Color(0xFF7203FF),
              icon: const Icon(Icons.store_outlined),
              title: const Text('Vendors'),
            ),
            SalomonBottomBarItem(
              selectedColor: const Color(0xFF7203FF),
              icon: const Icon(Icons.person_outline),
              title: const Text('Vendors'),
            )
          ],
        );
      },
    );
  }
}
