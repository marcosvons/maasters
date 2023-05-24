// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String mail,
    required String firstName,
    required String lastName,
  }) = _User;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  const UserDto._();

  factory UserDto.fromModel(User user) => UserDto(
        id: user.id,
        mail: user.mail,
        firstName: user.firstName,
        lastName: user.lastName,
      );

  User toModel() => User(
        id: id,
        mail: mail,
        firstName: firstName,
        lastName: lastName,
      );
}
