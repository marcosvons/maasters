part of 'mentorships_bloc.dart';

@freezed
class MentorshipsEvent with _$MentorshipsEvent {
  const factory MentorshipsEvent.addMentor({
    required List<SpecificInterest> interests,
  }) = _AddMentor;
  const factory MentorshipsEvent.getMentors({
    required List<SpecificInterest> interest,
    required String userId,
  }) = _GetMentors;
  const factory MentorshipsEvent.searchMentors({required String query}) =
      _SearchMentors;
}
