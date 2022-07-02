import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce/src/features/home/presentation/home_screen.dart';
import 'package:e_commerce/src/features/profile/presentation/profile_screen.dart';
import 'package:e_commerce/src/features/vendors/presentation/vendor_screen.dart';
import 'package:e_commerce/src/features/product_listing/presentation/product_listing_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(
            path: 'products',
            name: 'ProductRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: ProductListing,
              ),
            ]),
        AutoRoute(
            path: 'cart',
            name: 'CartRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: CartScreen,
              )
            ]),
        AutoRoute(
            path: 'vendors',
            name: 'VendorRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: VendorScreen,
              )
            ]),
        AutoRoute(
            path: 'profile',
            name: 'ProfileRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: ProfileScreen,
              )
            ]),
      ],
    )
  ],
)
class $myAppRouter {}
