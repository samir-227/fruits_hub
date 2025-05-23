import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cache helper class that provides methods to store and retrieve data
/// from SharedPreferences and FlutterSecureStorage.
class CacheHelper {
  static late SharedPreferences _prefs;
  static late FlutterSecureStorage _storage;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _storage = const FlutterSecureStorage();


  }


  static Future<void> set({required String key, required dynamic value}) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw UnsupportedError('Type not supported');
    }
  }


  static String getString({required String key}) {
    return _prefs.getString(key) ?? '';
  }

  static int? getInt({required String key}) {
    return _prefs.getInt(key);
  }

  static bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }


  static double? getDouble({required String key}) {
    return _prefs.getDouble(key);
  }

  // Retrieves a list of strings from SharedPreferences.
  static List<String>? getStringList({required String key}) {
    return _prefs.getStringList(key);
  }

  // removing data for specific key
  static Future<void> delete({required String key}) async {
    await _prefs.remove(key);
  }

  // removing all data
  static Future<void> deleteAllData() async {
    await _prefs.clear();
  }

  // Writing Secure Data
  static Future<void> setSecureData(
      {required String key, required String value}) async {
    _storage.write(key: key, value: value);
  }

  // Retrieving Secure Data
  static Future<String?> getSecureData({required String key}) async {
    return _storage.read(key: key);
  }

  // Removing Secure Data for specific key.
  static Future<void> deleteSecureData({required String key}) async {
    await _storage.delete(key: key);
  }

  // Removing all Secure Data
  static Future<void> deleteAllSecureData() async {
    await _storage.deleteAll();
  }


  // Opens the box to store cart items.
  // Future<Box<CartItemEntity>> _openBox() async {
  //   return await Hive.openBox<CartItemEntity>(kCartBoxName);
  // }

  // // Retrieves all cart items.
  // Future<List<CartItemEntity>> getCartItems() async {
  //   final box = await _openBox();
  //   return box.values.toList();
  // }

  // // Adds a cart item.
  // Future<void> addCartItem(CartItemEntity item) async {
  //   final box = await _openBox();
  //   await box.put(item.product.code, item);
  // }

  // // Updates a cart item.
  // Future<void> updateCartItem(CartItemEntity item) async {
  //   final box = await _openBox();
  //   await box.put(item.product.code, item);
  // }

  // // Deletes a cart item.
  // Future<void> deleteCartItem(String productCode) async {
  //   final box = await _openBox();
  //   await box.delete(productCode);
  // }

  // // Clears the cart.
  // Future<void> clearCart() async {
  //   final box = await _openBox();
  //   await box.clear();
  // }
}

