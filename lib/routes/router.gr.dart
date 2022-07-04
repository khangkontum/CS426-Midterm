// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i12;

import '../src/features/cart/presentation/cart_screen.dart' as _i7;
import '../src/features/home/presentation/home_screen.dart' as _i3;
import '../src/features/map/presentation/map_screen.dart' as _i9;
import '../src/features/product_listing/models/product.dart' as _i13;
import '../src/features/product_listing/presentation/product_detail_screen.dart'
    as _i6;
import '../src/features/product_listing/presentation/product_listing_screen.dart'
    as _i5;
import '../src/features/profile/presentation/profile_screen.dart' as _i11;
import '../src/features/root/features/signup/signup_screen.dart' as _i2;
import '../src/features/root/presentatition/root_screen.dart' as _i1;
import '../src/features/vendors/features/presentation/vendor_detail_screen.dart'
    as _i10;
import '../src/features/vendors/presentation/vendor_screen.dart' as _i8;

class myAppRouter extends _i4.RootStackRouter {
  myAppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    RootScreen.name: (routeData) {
      final args = routeData.argsAs<RootScreenArgs>(
          orElse: () => const RootScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.RootScreen(key: args.key));
    },
    SignupScreen.name: (routeData) {
      final args = routeData.argsAs<SignupScreenArgs>(
          orElse: () => const SignupScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignupScreen(key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomePage(key: args.key));
    },
    ProductRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    CartRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    VendorRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    ProductListing.name: (routeData) {
      final args = routeData.argsAs<ProductListingArgs>(
          orElse: () => const ProductListingArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.ProductListing(key: args.key));
    },
    ProductDetail.name: (routeData) {
      final args = routeData.argsAs<ProductDetailArgs>(
          orElse: () => const ProductDetailArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ProductDetail(key: args.key, product: args.product));
    },
    CartScreen.name: (routeData) {
      final args = routeData.argsAs<CartScreenArgs>(
          orElse: () => const CartScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.CartScreen(key: args.key));
    },
    VendorScreen.name: (routeData) {
      final args = routeData.argsAs<VendorScreenArgs>(
          orElse: () => const VendorScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.VendorScreen(key: args.key));
    },
    MapScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.MapScreen());
    },
    VendorDetailScreen.name: (routeData) {
      final args = routeData.argsAs<VendorDetailScreenArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.VendorDetailScreen(key: args.key, vendorId: args.vendorId));
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.ProfileScreen(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(RootScreen.name, path: '/'),
        _i4.RouteConfig(SignupScreen.name, path: '/signup'),
        _i4.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i4.RouteConfig(ProductRoute.name,
              path: 'products',
              parent: HomeRoute.name,
              children: [
                _i4.RouteConfig(ProductListing.name,
                    path: '', parent: ProductRoute.name),
                _i4.RouteConfig(ProductDetail.name,
                    path: 'productDetail', parent: ProductRoute.name)
              ]),
          _i4.RouteConfig(CartRoute.name,
              path: 'cart',
              parent: HomeRoute.name,
              children: [
                _i4.RouteConfig(CartScreen.name,
                    path: '', parent: CartRoute.name)
              ]),
          _i4.RouteConfig(VendorRoute.name,
              path: 'vendors',
              parent: HomeRoute.name,
              children: [
                _i4.RouteConfig(VendorScreen.name,
                    path: '', parent: VendorRoute.name),
                _i4.RouteConfig(MapScreen.name,
                    path: 'maps', parent: VendorRoute.name),
                _i4.RouteConfig(VendorDetailScreen.name,
                    path: 'vendor_datail', parent: VendorRoute.name),
                _i4.RouteConfig(ProductDetail.name,
                    path: 'productDetail', parent: VendorRoute.name)
              ]),
          _i4.RouteConfig(ProfileRoute.name,
              path: 'profile',
              parent: HomeRoute.name,
              children: [
                _i4.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.RootScreen]
class RootScreen extends _i4.PageRouteInfo<RootScreenArgs> {
  RootScreen({_i12.Key? key})
      : super(RootScreen.name, path: '/', args: RootScreenArgs(key: key));

  static const String name = 'RootScreen';
}

class RootScreenArgs {
  const RootScreenArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'RootScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignupScreen]
class SignupScreen extends _i4.PageRouteInfo<SignupScreenArgs> {
  SignupScreen({_i12.Key? key})
      : super(SignupScreen.name,
            path: '/signup', args: SignupScreenArgs(key: key));

  static const String name = 'SignupScreen';
}

class SignupScreenArgs {
  const SignupScreenArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignupScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i12.Key? key, List<_i4.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/home',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ProductRoute extends _i4.PageRouteInfo<void> {
  const ProductRoute({List<_i4.PageRouteInfo>? children})
      : super(ProductRoute.name, path: 'products', initialChildren: children);

  static const String name = 'ProductRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class CartRoute extends _i4.PageRouteInfo<void> {
  const CartRoute({List<_i4.PageRouteInfo>? children})
      : super(CartRoute.name, path: 'cart', initialChildren: children);

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class VendorRoute extends _i4.PageRouteInfo<void> {
  const VendorRoute({List<_i4.PageRouteInfo>? children})
      : super(VendorRoute.name, path: 'vendors', initialChildren: children);

  static const String name = 'VendorRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute({List<_i4.PageRouteInfo>? children})
      : super(ProfileRoute.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.ProductListing]
class ProductListing extends _i4.PageRouteInfo<ProductListingArgs> {
  ProductListing({_i12.Key? key})
      : super(ProductListing.name,
            path: '', args: ProductListingArgs(key: key));

  static const String name = 'ProductListing';
}

class ProductListingArgs {
  const ProductListingArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ProductListingArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ProductDetail]
class ProductDetail extends _i4.PageRouteInfo<ProductDetailArgs> {
  ProductDetail({_i12.Key? key, _i13.Product? product})
      : super(ProductDetail.name,
            path: 'productDetail',
            args: ProductDetailArgs(key: key, product: product));

  static const String name = 'ProductDetail';
}

class ProductDetailArgs {
  const ProductDetailArgs({this.key, this.product});

  final _i12.Key? key;

  final _i13.Product? product;

  @override
  String toString() {
    return 'ProductDetailArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i7.CartScreen]
class CartScreen extends _i4.PageRouteInfo<CartScreenArgs> {
  CartScreen({_i12.Key? key})
      : super(CartScreen.name, path: '', args: CartScreenArgs(key: key));

  static const String name = 'CartScreen';
}

class CartScreenArgs {
  const CartScreenArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'CartScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.VendorScreen]
class VendorScreen extends _i4.PageRouteInfo<VendorScreenArgs> {
  VendorScreen({_i12.Key? key})
      : super(VendorScreen.name, path: '', args: VendorScreenArgs(key: key));

  static const String name = 'VendorScreen';
}

class VendorScreenArgs {
  const VendorScreenArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'VendorScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.MapScreen]
class MapScreen extends _i4.PageRouteInfo<void> {
  const MapScreen() : super(MapScreen.name, path: 'maps');

  static const String name = 'MapScreen';
}

/// generated route for
/// [_i10.VendorDetailScreen]
class VendorDetailScreen extends _i4.PageRouteInfo<VendorDetailScreenArgs> {
  VendorDetailScreen({_i12.Key? key, required String vendorId})
      : super(VendorDetailScreen.name,
            path: 'vendor_datail',
            args: VendorDetailScreenArgs(key: key, vendorId: vendorId));

  static const String name = 'VendorDetailScreen';
}

class VendorDetailScreenArgs {
  const VendorDetailScreenArgs({this.key, required this.vendorId});

  final _i12.Key? key;

  final String vendorId;

  @override
  String toString() {
    return 'VendorDetailScreenArgs{key: $key, vendorId: $vendorId}';
  }
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileScreen extends _i4.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i12.Key? key})
      : super(ProfileScreen.name, path: '', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}
