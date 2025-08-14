// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitDto> _$unitDtoSerializer = _$UnitDtoSerializer();

class _$UnitDtoSerializer implements StructuredSerializer<UnitDto> {
  @override
  final Iterable<Type> types = const [UnitDto, _$UnitDto];
  @override
  final String wireName = 'UnitDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, UnitDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('coupon_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discount;
    if (value != null) {
      result
        ..add('discount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UnitDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UnitDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'coupon_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'discount':
          result.discount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitDto extends UnitDto {
  @override
  final String? name;
  @override
  final String? discount;

  factory _$UnitDto([void Function(UnitDtoBuilder)? updates]) =>
      (UnitDtoBuilder()..update(updates))._build();

  _$UnitDto._({this.name, this.discount}) : super._();
  @override
  UnitDto rebuild(void Function(UnitDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitDtoBuilder toBuilder() => UnitDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitDto && name == other.name && discount == other.discount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, discount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnitDto')
          ..add('name', name)
          ..add('discount', discount))
        .toString();
  }
}

class UnitDtoBuilder implements Builder<UnitDto, UnitDtoBuilder> {
  _$UnitDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _discount;
  String? get discount => _$this._discount;
  set discount(String? discount) => _$this._discount = discount;

  UnitDtoBuilder();

  UnitDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _discount = $v.discount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitDto other) {
    _$v = other as _$UnitDto;
  }

  @override
  void update(void Function(UnitDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnitDto build() => _build();

  _$UnitDto _build() {
    final _$result = _$v ??
        _$UnitDto._(
          name: name,
          discount: discount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
