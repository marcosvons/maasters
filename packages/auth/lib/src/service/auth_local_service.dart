// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:hive/hive.dart';

abstract class IAuthLocalService {
  Future<void> setCacheUser({required UserDto userDto});
  Future<UserDto> getCacheUser();
  Future<void> updateCacheUser();
  Future<void> removeCacheUser();
  Stream<UserDto> get userStream;
}

class AuthLocalService implements IAuthLocalService {
  AuthLocalService(Box<String> box) : _box = box;

  final Box<String> _box;

  @override
  Future<UserDto> getCacheUser() {
    // TODO: implement getCacheUser
    throw UnimplementedError();
  }

  @override
  Future<void> removeCacheUser() {
    // TODO: implement removeCacheUser
    throw UnimplementedError();
  }

  @override
  Future<void> setCacheUser({required UserDto userDto}) {
    // TODO: implement setCacheUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement userStream
  Stream<UserDto> get userStream => throw UnimplementedError();

  @override
  Future<void> updateCacheUser() {
    // TODO: implement updateCacheUser
    throw UnimplementedError();
  }
}
