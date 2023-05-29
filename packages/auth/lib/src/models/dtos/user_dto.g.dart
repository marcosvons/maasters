// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String,
      mail: json['mail'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      googleName: json['googleName'] as String? ?? '',
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']) ??
          Gender.notSpecified,
      country: json['country'] as String? ?? '',
      description: json['description'] as String? ?? '',
      photoUrl: json['photoUrl'] as String? ?? '',
      areasOfInterest: (json['areasOfInterest'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$SpecificInterestEnumMap, e))
              .toList() ??
          const [],
      socialMedia: (json['socialMedia'] as List<dynamic>?)
              ?.map((e) => SocialMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      profileType:
          $enumDecodeNullable(_$ProfileTypeEnumMap, json['profileType']) ??
              ProfileType.unknown,
      seniority: $enumDecodeNullable(_$SeniorityEnumMap, json['seniority']) ??
          Seniority.unknown,
      onboardingCompleted: json['onboardingCompleted'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      company: json['company'] as String? ?? '',
      school: json['school'] as String? ?? '',
      title: json['title'] as String? ?? '',
      objective: (json['objective'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ObjectiveEnumMap, e))
              .toList() ??
          const [],
      yearsOfProfesionalExperience:
          json['yearsOfProfesionalExperience'] as int? ?? 0,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mail': instance.mail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'googleName': instance.googleName,
      'gender': _$GenderEnumMap[instance.gender]!,
      'country': instance.country,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'areasOfInterest': instance.areasOfInterest
          .map((e) => _$SpecificInterestEnumMap[e]!)
          .toList(),
      'socialMedia': instance.socialMedia,
      'profileType': _$ProfileTypeEnumMap[instance.profileType]!,
      'seniority': _$SeniorityEnumMap[instance.seniority]!,
      'onboardingCompleted': instance.onboardingCompleted,
      'phoneNumber': instance.phoneNumber,
      'company': instance.company,
      'school': instance.school,
      'title': instance.title,
      'objective':
          instance.objective.map((e) => _$ObjectiveEnumMap[e]!).toList(),
      'yearsOfProfesionalExperience': instance.yearsOfProfesionalExperience,
      'birthDate': instance.birthDate?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.notSpecified: 'notSpecified',
  Gender.unknown: 'unknown',
};

const _$SpecificInterestEnumMap = {
  SpecificInterest.cyberSecurity: 'cyberSecurity',
  SpecificInterest.dataScience: 'dataScience',
  SpecificInterest.devOps: 'devOps',
  SpecificInterest.htmlAndCss: 'htmlAndCss',
  SpecificInterest.javascript: 'javascript',
  SpecificInterest.react: 'react',
  SpecificInterest.angular: 'angular',
  SpecificInterest.vue: 'vue',
  SpecificInterest.jQuery: 'jQuery',
  SpecificInterest.bootstrap: 'bootstrap',
  SpecificInterest.typescript: 'typescript',
  SpecificInterest.dotNet: 'dotNet',
  SpecificInterest.java: 'java',
  SpecificInterest.nodejs: 'nodejs',
  SpecificInterest.php: 'php',
  SpecificInterest.ruby: 'ruby',
  SpecificInterest.python: 'python',
  SpecificInterest.go: 'go',
  SpecificInterest.rust: 'rust',
  SpecificInterest.flutter: 'flutter',
  SpecificInterest.reactNative: 'reactNative',
  SpecificInterest.swift: 'swift',
  SpecificInterest.kotlin: 'kotlin',
  SpecificInterest.qa: 'qa',
  SpecificInterest.uxUi: 'uxUi',
  SpecificInterest.digitalMarketing: 'digitalMarketing',
  SpecificInterest.productManagement: 'productManagement',
  SpecificInterest.ioT: 'ioT',
  SpecificInterest.blockchain: 'blockchain',
  SpecificInterest.graphicDesign: 'graphicDesign',
};

const _$ProfileTypeEnumMap = {
  ProfileType.mentee: 'mentee',
  ProfileType.mentor: 'mentor',
  ProfileType.unknown: 'unknown',
};

const _$SeniorityEnumMap = {
  Seniority.trainee: 'trainee',
  Seniority.junior: 'junior',
  Seniority.semiSenior: 'semiSenior',
  Seniority.senior: 'senior',
  Seniority.unknown: 'unknown',
};

const _$ObjectiveEnumMap = {
  Objective.findJob: 'findJob',
  Objective.learn: 'learn',
  Objective.network: 'network',
  Objective.grow: 'grow',
  Objective.change: 'change',
  Objective.other: 'other',
  Objective.notSure: 'notSure',
};
