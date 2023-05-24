// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String mail,
    required String firstName,
    required String lastName,
    @Default([]) List<SpecificInterest> areasOfInterest,
    @Default([]) List<SocialMedia> socialMedia,
    @Default(ProfileType.unknown) ProfileType profileType,
    @Default(Seniority.unknown) Seniority seniority,
    @Default(false) bool onboardingCompleted,
    @Default('') String phoneNumber,
    @Default('') String? company,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum Seniority {
  trainee,
  junior,
  semiSenior,
  senior,
  unknown,
}

enum ProfileType {
  trainee,
  mentor,
  both,
  unknown,
}

enum SpecificInterest {
  cyberSecurity('Ciberseguridad', AreaOfInterest.cyberSecurity),
  dataScience('Ciencia de datos', AreaOfInterest.dataScience),
  devOps('DevOps', AreaOfInterest.devOps),
  htmlAndCss('HTML y CSS', AreaOfInterest.frontEnd),
  javascript('JavaScript', AreaOfInterest.frontEnd),
  react('React', AreaOfInterest.frontEnd),
  angular('Angular', AreaOfInterest.frontEnd),
  vue('Vue', AreaOfInterest.frontEnd),
  jQuery('jQuery', AreaOfInterest.frontEnd),
  bootstrap('Bootstrap', AreaOfInterest.frontEnd),
  typescript('TypeScript', AreaOfInterest.frontEnd),
  dotNet('.Net', AreaOfInterest.backEnd),
  java('Java', AreaOfInterest.backEnd),
  nodejs('Node.js', AreaOfInterest.backEnd),
  php('PHP', AreaOfInterest.backEnd),
  ruby('Ruby', AreaOfInterest.backEnd),
  python('Python', AreaOfInterest.backEnd),
  go('Go', AreaOfInterest.backEnd),
  rust('Rust', AreaOfInterest.backEnd),
  flutter('Flutter', AreaOfInterest.mobile),
  reactNative('React Native', AreaOfInterest.mobile),
  swift('Swift', AreaOfInterest.mobile),
  kotlin('Kotlin', AreaOfInterest.mobile),
  qa('QA', AreaOfInterest.qa),
  uxUi('UX/UI', AreaOfInterest.uxUi),
  digitalMarketing('Marketing digital', AreaOfInterest.digitalMarketing),
  productManagement('Product Management', AreaOfInterest.productManagement),
  ioT('IoT', AreaOfInterest.ioT),
  blockchain('Blockchain', AreaOfInterest.blockchain),
  graphicDesign('Diseño gráfico', AreaOfInterest.graphicDesign);

  const SpecificInterest(this.name, this.category);

  final String name;
  final AreaOfInterest category;
}

enum AreaOfInterest {
  qa,
  frontEnd,
  backEnd,
  mobile,
  uxUi,
  digitalMarketing,
  productManagement,
  cyberSecurity,
  dataScience,
  devOps,
  ioT,
  blockchain,
  graphicDesign,
}
