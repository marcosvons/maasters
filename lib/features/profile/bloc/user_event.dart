part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.updateUser({required User user, Uint8List? image}) =
      _UpdateUser;
}
