import 'package:flutter_template/core/services/cache_service/cache_service.dart';
import 'package:flutter_template/features/auth/domain/entities/role_entity.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheServiceImpl<T> implements CacheService{

  static Box? _box;

  Future<void> initService() async {

    await Hive.initFlutter();

    Hive.registerAdapter(UserEntityAdapter());
    Hive.registerAdapter(RoleAdapter());

    //clearAllCache();

    await _initBox();

  }

  Future<void> _initBox() async {

  if (_box == null || !Hive.isBoxOpen("cacheBox")) {

    _box = await Hive.openBox("cacheBox");

  }

}

  @override
  Future<void> storeData({required String key, required data,Duration ttl = const Duration(hours: 24)}) async {

    await _initBox();

    final expirationTime = DateTime.now().add(ttl).toIso8601String();

    final cacheData = {
      'expirationTime': expirationTime,
      'data': data,
    };

    await _box!.put(key, cacheData);
    
  }

  @override
  T? getData({required String key}) {

    if (_box == null || !_box!.isOpen) return null;

    final cacheData = _box!.get(key);

    if (cacheData == null) return null;

    final expirationTime = DateTime.parse(cacheData['expirationTime']);

    if (DateTime.now().isAfter(expirationTime)) {

      _box!.delete(key); 

      return null;

    }

    return cacheData['data'];

  }

  @override
  Future<void> deleteData({required String key}) async {
    await _initBox();
    await _box!.delete(key);
  }

  Future<void> clearCache(String key) async {
    await _initBox();
    await _box!.delete(key);
  }

  Future<void> clearAllCache() async {
    await _initBox();
    await _box!.clear();
  }

  Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _box = null;
    }
  }
}
