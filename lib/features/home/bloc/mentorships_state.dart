part of 'mentorships_bloc.dart';

@freezed
class MentorshipsState with _$MentorshipsState {
  const factory MentorshipsState.initial() = _Initial;
  const factory MentorshipsState.loading() = _Loading;
  const factory MentorshipsState.loaded({required List<User> mentors}) =
      _Loaded;
  const factory MentorshipsState.error() = _Error;
}
