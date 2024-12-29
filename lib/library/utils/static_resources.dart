// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:flutter/foundation.dart';

class StaticResources {
  static const String BASE_URL_IMAGES =
      "https://hwtojcjjxckgkmdjjfkq.supabase.co/storage/v1/object/public/";

  static const String REFRECH_PRODUCTS = "refrech_products";
  static const String REFRECH_CATEGORIES = "refrech_categories";
  static const String REFRECH_CACHE_IMAGE = "refrech_cache_image";
  static const String REFRECH_COUNT_SHOPPING_CART =
      "refrech_count_shopping_cart";
  static const String INIT_REALTIME_NOTES = "init_realTime_notes";
  static const String REFRECH_PRODUCTS_CATEGORY = "refrech_products_category";
  static const String REFRECH_SHOPS = "refrech_shops";
  static const String REFRECH_USER = "refrech_user";

  static bool get isMobile => Platform.isIOS || Platform.isAndroid;

  static platformType() {
    if (kIsWeb) {
      return TypeDevice.Web;
    } else if (Platform.isMacOS) {
      return TypeDevice.MacOS;
    } else if (Platform.isWindows) {
      return TypeDevice.Windows;
    } else if (Platform.isFuchsia) {
      return TypeDevice.Fuchsia;
    } else if (Platform.isAndroid) {
      return TypeDevice.Android;
    } else if (Platform.isIOS) {
      return TypeDevice.Ios;
    } else if (Platform.isLinux) {
      return TypeDevice.Linux;
    }
  }
}

enum TypeDevice { Android, Ios, Web, Windows, MacOS, Linux, Fuchsia }
