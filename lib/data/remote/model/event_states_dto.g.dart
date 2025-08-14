// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_states_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventStatesDto> _$eventStatesDtoSerializer =
    _$EventStatesDtoSerializer();

class _$EventStatesDtoSerializer
    implements StructuredSerializer<EventStatesDto> {
  @override
  final Iterable<Type> types = const [EventStatesDto, _$EventStatesDto];
  @override
  final String wireName = 'EventStatesDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventStatesDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'today_booked',
      serializers.serialize(object.todayBooked,
          specifiedType: const FullType(String)),
      'today_revenue',
      serializers.serialize(object.todayRevenue,
          specifiedType: const FullType(String)),
      'total_booked',
      serializers.serialize(object.totalBooked,
          specifiedType: const FullType(String)),
      'total_revenue',
      serializers.serialize(object.totalRevenue,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EventStatesDto deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = EventStatesDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'today_booked':
          result.todayBooked = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'today_revenue':
          result.todayRevenue = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total_booked':
          result.totalBooked = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total_revenue':
          result.totalRevenue = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EventStatesDto extends EventStatesDto {
  @override
  final String todayBooked;
  @override
  final String todayRevenue;
  @override
  final String totalBooked;
  @override
  final String totalRevenue;

  factory _$EventStatesDto([void Function(EventStatesDtoBuilder)? updates]) =>
      (EventStatesDtoBuilder()..update(updates))._build();

  _$EventStatesDto._(
      {required this.todayBooked,
      required this.todayRevenue,
      required this.totalBooked,
      required this.totalRevenue})
      : super._();
  @override
  EventStatesDto rebuild(void Function(EventStatesDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventStatesDtoBuilder toBuilder() => EventStatesDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventStatesDto &&
        todayBooked == other.todayBooked &&
        todayRevenue == other.todayRevenue &&
        totalBooked == other.totalBooked &&
        totalRevenue == other.totalRevenue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, todayBooked.hashCode);
    _$hash = $jc(_$hash, todayRevenue.hashCode);
    _$hash = $jc(_$hash, totalBooked.hashCode);
    _$hash = $jc(_$hash, totalRevenue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventStatesDto')
          ..add('todayBooked', todayBooked)
          ..add('todayRevenue', todayRevenue)
          ..add('totalBooked', totalBooked)
          ..add('totalRevenue', totalRevenue))
        .toString();
  }
}

class EventStatesDtoBuilder
    implements Builder<EventStatesDto, EventStatesDtoBuilder> {
  _$EventStatesDto? _$v;

  String? _todayBooked;
  String? get todayBooked => _$this._todayBooked;
  set todayBooked(String? todayBooked) => _$this._todayBooked = todayBooked;

  String? _todayRevenue;
  String? get todayRevenue => _$this._todayRevenue;
  set todayRevenue(String? todayRevenue) => _$this._todayRevenue = todayRevenue;

  String? _totalBooked;
  String? get totalBooked => _$this._totalBooked;
  set totalBooked(String? totalBooked) => _$this._totalBooked = totalBooked;

  String? _totalRevenue;
  String? get totalRevenue => _$this._totalRevenue;
  set totalRevenue(String? totalRevenue) => _$this._totalRevenue = totalRevenue;

  EventStatesDtoBuilder();

  EventStatesDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _todayBooked = $v.todayBooked;
      _todayRevenue = $v.todayRevenue;
      _totalBooked = $v.totalBooked;
      _totalRevenue = $v.totalRevenue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventStatesDto other) {
    _$v = other as _$EventStatesDto;
  }

  @override
  void update(void Function(EventStatesDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventStatesDto build() => _build();

  _$EventStatesDto _build() {
    final _$result = _$v ??
        _$EventStatesDto._(
          todayBooked: BuiltValueNullFieldError.checkNotNull(
              todayBooked, r'EventStatesDto', 'todayBooked'),
          todayRevenue: BuiltValueNullFieldError.checkNotNull(
              todayRevenue, r'EventStatesDto', 'todayRevenue'),
          totalBooked: BuiltValueNullFieldError.checkNotNull(
              totalBooked, r'EventStatesDto', 'totalBooked'),
          totalRevenue: BuiltValueNullFieldError.checkNotNull(
              totalRevenue, r'EventStatesDto', 'totalRevenue'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
