import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorships/mentorships.dart';

part 'mentorships_event.dart';
part 'mentorships_state.dart';
part 'mentorships_bloc.freezed.dart';

class MentorshipsBloc extends Bloc<MentorshipsEvent, MentorshipsState> {
  MentorshipsBloc({required IMentorshipsRepository mentorshipsRepository})
      : _mentorshipsRepository = mentorshipsRepository,
        super(const _Initial()) {
    on<_AddMentor>(_addMentor);
    on<_GetMentors>(_getMentors);
  }

  final IMentorshipsRepository _mentorshipsRepository;

  FutureOr<void> _addMentor(
    _AddMentor event,
    Emitter<MentorshipsState> emit,
  ) {}

  FutureOr<void> _getMentors(
    _GetMentors event,
    Emitter<MentorshipsState> emit,
  ) async {
    emit(const MentorshipsState.loading());
    final possibleMentorsListOrFailure =
        await _mentorshipsRepository.getMentors(
      interests: event.interest,
    );
    possibleMentorsListOrFailure.fold(
      (failure) => emit(const MentorshipsState.error()),
      (mentors) => emit(MentorshipsState.loaded(mentors: mentors)),
    );
  }
}
