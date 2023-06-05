// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

abstract class IMentorshipsRepository {
  Future<Either<Failure, List<User>>> getMentors({
    required List<SpecificInterest> interests,
  });
}

class MentorshipsRepository implements IMentorshipsRepository {
  const MentorshipsRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<Either<Failure, List<User>>> getMentors({
    required List<SpecificInterest> interests,
  }) async {
    try {
      final mentors = <User>[];
      print(interests[0].toString().split('.').last);
      for (final interest in interests) {
        await _firestore
            .collection(Keys.usersCollection)
            .where(
              'areasOfInterest',
              arrayContains: interest.toString().split('.').last,
            )
            .where(
              'profileType',
              isEqualTo: ProfileType.mentor.toString().split('.').last,
            )
            .get()
            .then(
              (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach(
                (DocumentSnapshot documentSnapshot) {
                  final mentor = UserDto.fromJson(
                    documentSnapshot.data() as Map<String, dynamic>,
                  ).toModel();

                  if (!mentors.contains(mentor)) {
                    mentors.add(mentor);
                  }
                },
              ),
            );
      }
      return Right(mentors);
    } catch (e) {
      return const Left(FirestoreGetUserFailure());
    }
  }
}
