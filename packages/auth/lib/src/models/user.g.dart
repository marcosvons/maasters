// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      mail: json['mail'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
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
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'mail': instance.mail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'areasOfInterest': instance.areasOfInterest
          .map((e) => _$SpecificInterestEnumMap[e]!)
          .toList(),
      'socialMedia': instance.socialMedia,
      'profileType': _$ProfileTypeEnumMap[instance.profileType]!,
      'seniority': _$SeniorityEnumMap[instance.seniority]!,
      'onboardingCompleted': instance.onboardingCompleted,
      'phoneNumber': instance.phoneNumber,
      'company': instance.company,
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
  ProfileType.trainee: 'trainee',
  ProfileType.mentor: 'mentor',
  ProfileType.both: 'both',
  ProfileType.unknown: 'unknown',
};

const _$SeniorityEnumMap = {
  Seniority.trainee: 'trainee',
  Seniority.junior: 'junior',
  Seniority.semiSenior: 'semiSenior',
  Seniority.senior: 'senior',
  Seniority.unknown: 'unknown',
};
