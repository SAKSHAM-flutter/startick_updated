// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GuestDto> _$guestDtoSerializer = _$GuestDtoSerializer();

class _$GuestDtoSerializer implements StructuredSerializer<GuestDto> {
  @override
  final Iterable<Type> types = const [GuestDto, _$GuestDto];
  @override
  final String wireName = 'GuestDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, GuestDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GuestDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GuestDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GuestDto extends GuestDto {
  @override
  final String name;
  @override
  final String status;

  factory _$GuestDto([void Function(GuestDtoBuilder)? updates]) =>
      (GuestDtoBuilder()..update(updates))._build();

  _$GuestDto._({required this.name, required this.status}) : super._();
  @override
  GuestDto rebuild(void Function(GuestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GuestDtoBuilder toBuilder() => GuestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GuestDto && name == other.name && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GuestDto')
          ..add('name', name)
          ..add('status', status))
        .toString();
  }
}

class GuestDtoBuilder implements Builder<GuestDto, GuestDtoBuilder> {
  _$GuestDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  GuestDtoBuilder();

  GuestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GuestDto other) {
    _$v = other as _$GuestDto;
  }

  @override
  void update(void Function(GuestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GuestDto build() => _build();

  _$GuestDto _build() {
    final _$result = _$v ??
        _$GuestDto._(
          name:
              BuiltValueNullFieldError.checkNotNull(name, r'GuestDto', 'name'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'GuestDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
