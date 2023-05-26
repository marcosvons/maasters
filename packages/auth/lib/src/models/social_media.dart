// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media.freezed.dart';
part 'social_media.g.dart';

@freezed
class SocialMedia with _$SocialMedia {
  const factory SocialMedia({
    required String name,
    required String url,
  }) = _SocialMedia;

  const SocialMedia._();

  factory SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaFromJson(json);
}
