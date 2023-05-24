// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media.freezed.dart';

@freezed
class SocialMedia with _$SocialMedia {
  const factory SocialMedia({
    required String name,
    required String url,
  }) = _SocialMedia;
}
