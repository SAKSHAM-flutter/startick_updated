import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'banner_dto.g.dart';

abstract class BannerDto implements Built<BannerDto, BannerDtoBuilder> {
  BannerDto._();

  @BuiltValueField(wireName: "id")
  String get id;

  @BuiltValueField(wireName: "adsimage")
  String get adsImage;

  @BuiltValueField(wireName: "url")
  String? get url;

  static Serializer<BannerDto> get serializer => _$bannerDtoSerializer;

  factory BannerDto([void Function(BannerDtoBuilder)? updates]) = _$BannerDto;
}
