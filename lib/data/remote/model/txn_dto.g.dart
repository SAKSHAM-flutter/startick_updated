// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txn_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TxnDto> _$txnDtoSerializer = _$TxnDtoSerializer();

class _$TxnDtoSerializer implements StructuredSerializer<TxnDto> {
  @override
  final Iterable<Type> types = const [TxnDto, _$TxnDto];
  @override
  final String wireName = 'TxnDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, TxnDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'customer_name',
      serializers.serialize(object.customerName,
          specifiedType: const FullType(String)),
      'confirmation_code ',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'event_name',
      serializers.serialize(object.eventName,
          specifiedType: const FullType(String)),
      'event_datetime',
      serializers.serialize(object.eventDatetime,
          specifiedType: const FullType(String)),
      'event_venue',
      serializers.serialize(object.eventVenue,
          specifiedType: const FullType(String)),
      'tickets',
      serializers.serialize(object.tickets,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TxnDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TxnDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'customer_name':
          result.customerName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'confirmation_code ':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'event_name':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'event_datetime':
          result.eventDatetime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'event_venue':
          result.eventVenue = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'tickets':
          result.tickets = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TxnDto extends TxnDto {
  @override
  final String customerName;
  @override
  final String code;
  @override
  final String eventName;
  @override
  final String eventDatetime;
  @override
  final String eventVenue;
  @override
  final String tickets;

  factory _$TxnDto([void Function(TxnDtoBuilder)? updates]) =>
      (TxnDtoBuilder()..update(updates))._build();

  _$TxnDto._(
      {required this.customerName,
      required this.code,
      required this.eventName,
      required this.eventDatetime,
      required this.eventVenue,
      required this.tickets})
      : super._();
  @override
  TxnDto rebuild(void Function(TxnDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TxnDtoBuilder toBuilder() => TxnDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TxnDto &&
        customerName == other.customerName &&
        code == other.code &&
        eventName == other.eventName &&
        eventDatetime == other.eventDatetime &&
        eventVenue == other.eventVenue &&
        tickets == other.tickets;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, customerName.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, eventName.hashCode);
    _$hash = $jc(_$hash, eventDatetime.hashCode);
    _$hash = $jc(_$hash, eventVenue.hashCode);
    _$hash = $jc(_$hash, tickets.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TxnDto')
          ..add('customerName', customerName)
          ..add('code', code)
          ..add('eventName', eventName)
          ..add('eventDatetime', eventDatetime)
          ..add('eventVenue', eventVenue)
          ..add('tickets', tickets))
        .toString();
  }
}

class TxnDtoBuilder implements Builder<TxnDto, TxnDtoBuilder> {
  _$TxnDto? _$v;

  String? _customerName;
  String? get customerName => _$this._customerName;
  set customerName(String? customerName) => _$this._customerName = customerName;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _eventName;
  String? get eventName => _$this._eventName;
  set eventName(String? eventName) => _$this._eventName = eventName;

  String? _eventDatetime;
  String? get eventDatetime => _$this._eventDatetime;
  set eventDatetime(String? eventDatetime) =>
      _$this._eventDatetime = eventDatetime;

  String? _eventVenue;
  String? get eventVenue => _$this._eventVenue;
  set eventVenue(String? eventVenue) => _$this._eventVenue = eventVenue;

  String? _tickets;
  String? get tickets => _$this._tickets;
  set tickets(String? tickets) => _$this._tickets = tickets;

  TxnDtoBuilder();

  TxnDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customerName = $v.customerName;
      _code = $v.code;
      _eventName = $v.eventName;
      _eventDatetime = $v.eventDatetime;
      _eventVenue = $v.eventVenue;
      _tickets = $v.tickets;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TxnDto other) {
    _$v = other as _$TxnDto;
  }

  @override
  void update(void Function(TxnDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TxnDto build() => _build();

  _$TxnDto _build() {
    final _$result = _$v ??
        _$TxnDto._(
          customerName: BuiltValueNullFieldError.checkNotNull(
              customerName, r'TxnDto', 'customerName'),
          code: BuiltValueNullFieldError.checkNotNull(code, r'TxnDto', 'code'),
          eventName: BuiltValueNullFieldError.checkNotNull(
              eventName, r'TxnDto', 'eventName'),
          eventDatetime: BuiltValueNullFieldError.checkNotNull(
              eventDatetime, r'TxnDto', 'eventDatetime'),
          eventVenue: BuiltValueNullFieldError.checkNotNull(
              eventVenue, r'TxnDto', 'eventVenue'),
          tickets: BuiltValueNullFieldError.checkNotNull(
              tickets, r'TxnDto', 'tickets'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
