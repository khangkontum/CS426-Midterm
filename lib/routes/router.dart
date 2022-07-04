import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce/src/features/home/presentation/home_screen.dart';
import 'package:e_commerce/src/features/map/presentation/map_screen.dart';
import 'package:e_commerce/src/features/product_listing/presentation/product_detail_screen.dart';
import 'package:e_commerce/src/features/profile/presentation/profile_screen.dart';
import 'package:e_commerce/src/features/root/features/signup/signup_screen.dart';
import 'package:e_commerce/src/features/root/presentatition/root_screen.dart';
import 'package:e_commerce/src/features/vendors/features/presentation/vendor_screen.dart';
import 'package:e_commerce/src/features/vendors/presentation/vendor_screen.dart';
import 'package:e_commerce/src/features/product_listing/presentation/product_listing_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: RootScreen,
      initial: true,
    ),
    AutoRoute(
      path: '/signup',
      page: SignupScreen,
    ),
    AutoRoute(
      path: '/home',
      page: HomePage,
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
              AutoRoute(
                path: 'productDetail',
                page: ProductDetail,
              )
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
              ),
              AutoRoute(
                path: 'maps',
                page: MapScreen,
              ),
              AutoRoute(
                path: 'vendor_detail',
                page: VendorDetailScreen,
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
    ),
  ],
)
class $myAppRouter {}
