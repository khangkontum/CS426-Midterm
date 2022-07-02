// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../src/features/cart/presentation/cart_screen.dart' as _i5;
import '../src/features/home/presentation/home_screen.dart' as _i1;
import '../src/features/product_listing/models/product.dart' as _i9;
import '../src/features/product_listing/presentation/product_detail_screen.dart'
    as _i4;
import '../src/features/product_listing/presentation/product_listing_screen.dart'
    as _i3;
import '../src/features/profile/presentation/profile_screen.dart' as _i7;
import '../src/features/vendors/presentation/vendor_screen.dart' as _i6;

class myAppRouter extends _i2.RootStackRouter {
  myAppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ProductRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CartRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    VendorRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ProductListing.name: (routeData) {
      final args = routeData.argsAs<ProductListingArgs>(
          orElse: () => const ProductListingArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ProductListing(key: args.key));
    },
    ProductDetail.name: (routeData) {
      final args = routeData.argsAs<ProductDetailArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ProductDetail(key: args.key, product: args.product));
    },
    CartScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CartScreen());
    },
    VendorScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.VendorScreen());
    },
    ProfileScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(ProductRoute.name,
              path: 'products',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(ProductListing.name,
                    path: '', parent: ProductRoute.name),
                _i2.RouteConfig(ProductDetail.name,
                    path: 'productDetail', parent: ProductRoute.name)
              ]),
          _i2.RouteConfig(CartRoute.name,
              path: 'cart',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(CartScreen.name,
                    path: '', parent: CartRoute.name)
              ]),
          _i2.RouteConfig(VendorRoute.name,
              path: 'vendors',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(VendorScreen.name,
                    path: '', parent: VendorRoute.name)
              ]),
          _i2.RouteConfig(ProfileRoute.name,
              path: 'profile',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProductRoute extends _i2.PageRouteInfo<void> {
  const ProductRoute({List<_i2.PageRouteInfo>? children})
      : super(ProductRoute.name, path: 'products', initialChildren: children);

  static const String name = 'ProductRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CartRoute extends _i2.PageRouteInfo<void> {
  const CartRoute({List<_i2.PageRouteInfo>? children})
      : super(CartRoute.name, path: 'cart', initialChildren: children);

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class VendorRoute extends _i2.PageRouteInfo<void> {
  const VendorRoute({List<_i2.PageRouteInfo>? children})
      : super(VendorRoute.name, path: 'vendors', initialChildren: children);

  static const String name = 'VendorRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute({List<_i2.PageRouteInfo>? children})
      : super(ProfileRoute.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ProductListing]
class ProductListing extends _i2.PageRouteInfo<ProductListingArgs> {
  ProductListing({_i8.Key? key})
      : super(ProductListing.name,
            path: '', args: ProductListingArgs(key: key));

  static const String name = 'ProductListing';
}

class ProductListingArgs {
  const ProductListingArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ProductListingArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ProductDetail]
class ProductDetail extends _i2.PageRouteInfo<ProductDetailArgs> {
  ProductDetail({_i8.Key? key, required _i9.Product product})
      : super(ProductDetail.name,
            path: 'productDetail',
            args: ProductDetailArgs(key: key, product: product));

  static const String name = 'ProductDetail';
}

class ProductDetailArgs {
  const ProductDetailArgs({this.key, required this.product});

  final _i8.Key? key;

  final _i9.Product product;

  @override
  String toString() {
    return 'ProductDetailArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i5.CartScreen]
class CartScreen extends _i2.PageRouteInfo<void> {
  const CartScreen() : super(CartScreen.name, path: '');

  static const String name = 'CartScreen';
}

/// generated route for
/// [_i6.VendorScreen]
class VendorScreen extends _i2.PageRouteInfo<void> {
  const VendorScreen() : super(VendorScreen.name, path: '');

  static const String name = 'VendorScreen';
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileScreen extends _i2.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '');

  static const String name = 'ProfileScreen';
}
