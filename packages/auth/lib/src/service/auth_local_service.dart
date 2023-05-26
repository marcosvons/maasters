// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:auth/auth.dart';
import 'package:errors/errors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

abstract class IAuthLocalService {
  Stream<UserDto?> get userStream;
  Future<void> setCacheUser({required UserDto userDto});
  UserDto? getCacheUser();
  Future<void> removeCacheUser();
}

class AuthLocalService implements IAuthLocalService {
  AuthLocalService(Box<String> box) : _box = box;

  final Box<String> _box;

  @override
  Stream<UserDto?> get userStream =>
      _box.watch(key: Keys.cachedLogin).map<UserDto?>((event) {
        try {
          final jsonStr = event.value as String?;

          if (jsonStr == null) return null;

          final result = jsonDecode(jsonStr);

          return UserDto.fromJson(result as Map<String, dynamic>);
        } catch (e) {
          throw CacheException();
        }
      }).startWith(getCacheUser());

  @override
  UserDto? getCacheUser() {
    try {
      final jsonStr = _box.get(Keys.cachedLogin);

      if (jsonStr == null) return null;

      final dynamic result = jsonDecode(jsonStr);

      return UserDto.fromJson(result as Map<String, dynamic>);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> removeCacheUser() async {
    try {
      await _box.delete(Keys.cachedLogin);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setCacheUser({required UserDto userDto}) async {
    try {
      await _box.put(Keys.cachedLogin, jsonEncode(userDto));
    } catch (e) {
      throw CacheException();
    }
  }
}
