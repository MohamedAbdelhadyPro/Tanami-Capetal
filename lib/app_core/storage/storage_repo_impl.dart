import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_repo.dart';

class StorageRepoImpl implements StorageRepo {
  static FlutterSecureStorage? storage = FlutterSecureStorage(
    iOptions: IOSOptions(),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    ),
  );

  @override
  Future<void> delete(String key) async {
    await storage!.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await storage!.deleteAll();
  }

  @override
  Future<String?> read(String key) async {
    String? value = await storage!.read(key: key);
    return value;
  }

  @override
  Future<void> write({required String key, required String value}) async {
    return await storage!.write(key: key, value: value);
  }

  @override
  Future<bool> isContains(String key) async {
    return await storage!.containsKey(key: key);
  }
}
