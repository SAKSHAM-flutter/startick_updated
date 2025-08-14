// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BannerDto> _$bannerDtoSerializer = _$BannerDtoSerializer();

class _$BannerDtoSerializer implements StructuredSerializer<BannerDto> {
  @override
  final Iterable<Type> types = const [BannerDto, _$BannerDto];
  @override
  final String wireName = 'BannerDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, BannerDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'adsimage',
      serializers.serialize(object.adsImage,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BannerDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BannerDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'adsimage':
          result.adsImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BannerDto extends BannerDto {
  @override
  final String id;
  @override
  final String adsImage;
  @override
  final String? url;

  factory _$BannerDto([void Function(BannerDtoBuilder)? updates]) =>
      (BannerDtoBuilder()..update(updates))._build();

  _$BannerDto._({required this.id, required this.adsImage, this.url})
      : super._();
  @override
  BannerDto rebuild(void Function(BannerDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BannerDtoBuilder toBuilder() => BannerDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BannerDto &&
        id == other.id &&
        adsImage == other.adsImage &&
        url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, adsImage.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BannerDto')
          ..add('id', id)
          ..add('adsImage', adsImage)
          ..add('url', url))
        .toString();
  }
}

class BannerDtoBuilder implements Builder<BannerDto, BannerDtoBuilder> {
  _$BannerDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _adsImage;
  String? get adsImage => _$this._adsImage;
  set adsImage(String? adsImage) => _$this._adsImage = adsImage;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  BannerDtoBuilder();

  BannerDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _adsImage = $v.adsImage;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BannerDto other) {
    _$v = other as _$BannerDto;
  }

  @override
  void update(void Function(BannerDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BannerDto build() => _build();

  _$BannerDto _build() {
    final _$result = _$v ??
        _$BannerDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'BannerDto', 'id'),
          adsImage: BuiltValueNullFieldError.checkNotNull(
              adsImage, r'BannerDto', 'adsImage'),
          url: url,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
