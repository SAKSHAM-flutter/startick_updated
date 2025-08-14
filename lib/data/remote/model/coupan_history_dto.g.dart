// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupan_history_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CoupanHistoryDto> _$coupanHistoryDtoSerializer =
    _$CoupanHistoryDtoSerializer();

class _$CoupanHistoryDtoSerializer
    implements StructuredSerializer<CoupanHistoryDto> {
  @override
  final Iterable<Type> types = const [CoupanHistoryDto, _$CoupanHistoryDto];
  @override
  final String wireName = 'CoupanHistoryDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, CoupanHistoryDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'coupon_id',
      serializers.serialize(object.couponId,
          specifiedType: const FullType(int)),
      'coupon_name',
      serializers.serialize(object.couponName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.scanTime;
    if (value != null) {
      result
        ..add('scan_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organiserName;
    if (value != null) {
      result
        ..add('organiser_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CoupanHistoryDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CoupanHistoryDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'coupon_id':
          result.couponId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'scan_time':
          result.scanTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organiser_name':
          result.organiserName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'coupon_name':
          result.couponName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$CoupanHistoryDto extends CoupanHistoryDto {
  @override
  final int couponId;
  @override
  final String? scanTime;
  @override
  final String? organiserName;
  @override
  final String couponName;
  @override
  final int? count;

  factory _$CoupanHistoryDto(
          [void Function(CoupanHistoryDtoBuilder)? updates]) =>
      (CoupanHistoryDtoBuilder()..update(updates))._build();

  _$CoupanHistoryDto._(
      {required this.couponId,
      this.scanTime,
      this.organiserName,
      required this.couponName,
      this.count})
      : super._();
  @override
  CoupanHistoryDto rebuild(void Function(CoupanHistoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoupanHistoryDtoBuilder toBuilder() =>
      CoupanHistoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoupanHistoryDto &&
        couponId == other.couponId &&
        scanTime == other.scanTime &&
        organiserName == other.organiserName &&
        couponName == other.couponName &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, couponId.hashCode);
    _$hash = $jc(_$hash, scanTime.hashCode);
    _$hash = $jc(_$hash, organiserName.hashCode);
    _$hash = $jc(_$hash, couponName.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CoupanHistoryDto')
          ..add('couponId', couponId)
          ..add('scanTime', scanTime)
          ..add('organiserName', organiserName)
          ..add('couponName', couponName)
          ..add('count', count))
        .toString();
  }
}

class CoupanHistoryDtoBuilder
    implements Builder<CoupanHistoryDto, CoupanHistoryDtoBuilder> {
  _$CoupanHistoryDto? _$v;

  int? _couponId;
  int? get couponId => _$this._couponId;
  set couponId(int? couponId) => _$this._couponId = couponId;

  String? _scanTime;
  String? get scanTime => _$this._scanTime;
  set scanTime(String? scanTime) => _$this._scanTime = scanTime;

  String? _organiserName;
  String? get organiserName => _$this._organiserName;
  set organiserName(String? organiserName) =>
      _$this._organiserName = organiserName;

  String? _couponName;
  String? get couponName => _$this._couponName;
  set couponName(String? couponName) => _$this._couponName = couponName;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  CoupanHistoryDtoBuilder();

  CoupanHistoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _couponId = $v.couponId;
      _scanTime = $v.scanTime;
      _organiserName = $v.organiserName;
      _couponName = $v.couponName;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoupanHistoryDto other) {
    _$v = other as _$CoupanHistoryDto;
  }

  @override
  void update(void Function(CoupanHistoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CoupanHistoryDto build() => _build();

  _$CoupanHistoryDto _build() {
    final _$result = _$v ??
        _$CoupanHistoryDto._(
          couponId: BuiltValueNullFieldError.checkNotNull(
              couponId, r'CoupanHistoryDto', 'couponId'),
          scanTime: scanTime,
          organiserName: organiserName,
          couponName: BuiltValueNullFieldError.checkNotNull(
              couponName, r'CoupanHistoryDto', 'couponName'),
          count: count,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
