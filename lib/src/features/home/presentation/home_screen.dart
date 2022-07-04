import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/cart/controllers/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Cart cart = Get.put(Cart());

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ProductRoute(),
        CartRoute(),
        VendorRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: SalomonBottomBar(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                selectedColor: const Color(0xFF7203FF),
                icon: const Icon(
                  Icons.grid_view_outlined,
                  size: 35,
                ),
                title: const Text('Browse'),
              ),
              SalomonBottomBarItem(
                selectedColor: const Color(0xFF7203FF),
                icon: Stack(children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 35,
                  ),
                  Positioned(
                      // draw a red marble
                      top: 0.0,
                      right: 0.0,
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.brightness_1,
                              size: 20.0,
                              color: Color(0xFFCBF265),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Obx(
                                () => Text(
                                  cart.totalItem.toString(),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ]),
                title: const Text('Cart'),
              ),
              SalomonBottomBarItem(
                selectedColor: const Color(0xFF7203FF),
                icon: const Icon(
                  Icons.store_outlined,
                  size: 35,
                ),
                title: const Text('Vendors'),
              ),
              SalomonBottomBarItem(
                selectedColor: const Color(0xFF7203FF),
                icon: const Icon(
                  Icons.person_outline_sharp,
                  size: 35,
                ),
                title: const Text('Profile'),
              ),
            ],
          ),
        );
      },
    );
  }
}
