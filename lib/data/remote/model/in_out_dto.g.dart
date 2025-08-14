// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_out_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InOutDto> _$inOutDtoSerializer = _$InOutDtoSerializer();

class _$InOutDtoSerializer implements StructuredSerializer<InOutDto> {
  @override
  final Iterable<Type> types = const [InOutDto, _$InOutDto];
  @override
  final String wireName = 'InOutDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, InOutDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'total_seat',
      serializers.serialize(object.totalSeat,
          specifiedType: const FullType(String)),
      'total_in',
      serializers.serialize(object.totalIn,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  InOutDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = InOutDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'total_seat':
          result.totalSeat = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total_in':
          result.totalIn = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InOutDto extends InOutDto {
  @override
  final String totalSeat;
  @override
  final String totalIn;

  factory _$InOutDto([void Function(InOutDtoBuilder)? updates]) =>
      (InOutDtoBuilder()..update(updates))._build();

  _$InOutDto._({required this.totalSeat, required this.totalIn}) : super._();
  @override
  InOutDto rebuild(void Function(InOutDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InOutDtoBuilder toBuilder() => InOutDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InOutDto &&
        totalSeat == other.totalSeat &&
        totalIn == other.totalIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalSeat.hashCode);
    _$hash = $jc(_$hash, totalIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InOutDto')
          ..add('totalSeat', totalSeat)
          ..add('totalIn', totalIn))
        .toString();
  }
}

class InOutDtoBuilder implements Builder<InOutDto, InOutDtoBuilder> {
  _$InOutDto? _$v;

  String? _totalSeat;
  String? get totalSeat => _$this._totalSeat;
  set totalSeat(String? totalSeat) => _$this._totalSeat = totalSeat;

  String? _totalIn;
  String? get totalIn => _$this._totalIn;
  set totalIn(String? totalIn) => _$this._totalIn = totalIn;

  InOutDtoBuilder();

  InOutDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalSeat = $v.totalSeat;
      _totalIn = $v.totalIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InOutDto other) {
    _$v = other as _$InOutDto;
  }

  @override
  void update(void Function(InOutDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InOutDto build() => _build();

  _$InOutDto _build() {
    final _$result = _$v ??
        _$InOutDto._(
          totalSeat: BuiltValueNullFieldError.checkNotNull(
              totalSeat, r'InOutDto', 'totalSeat'),
          totalIn: BuiltValueNullFieldError.checkNotNull(
              totalIn, r'InOutDto', 'totalIn'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
