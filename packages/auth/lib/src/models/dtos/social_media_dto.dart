// ignore_for_file: public_member_api_docs

import 'package:auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_dto.freezed.dart';
part 'social_media_dto.g.dart';

@freezed
class SocialMediaDto with _$SocialMediaDto {
  const factory SocialMediaDto({
    required String name,
    required String url,
  }) = _SocialMediaDto;

  const SocialMediaDto._();

  factory SocialMediaDto.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaDtoFromJson(json);

  factory SocialMediaDto.fromModel(SocialMedia socialMedia) => SocialMediaDto(
        name: socialMedia.name,
        url: socialMedia.url,
      );

  SocialMedia toModel() => SocialMedia(
        name: name,
        url: url,
      );

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
