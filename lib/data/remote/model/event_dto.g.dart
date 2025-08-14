// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventDto> _$eventDtoSerializer = _$EventDtoSerializer();

class _$EventDtoSerializer implements StructuredSerializer<EventDto> {
  @override
  final Iterable<Type> types = const [EventDto, _$EventDto];
  @override
  final String wireName = 'EventDto';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'eventtime',
      serializers.serialize(object.eventTime,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'total_seat',
      serializers.serialize(object.totalSeat,
          specifiedType: const FullType(String)),
      'booked_seat',
      serializers.serialize(object.bookedSeat,
          specifiedType: const FullType(String)),
      'available_seat',
      serializers.serialize(object.availableSeat,
          specifiedType: const FullType(String)),
      'vat',
      serializers.serialize(object.vat, specifiedType: const FullType(String)),
      'vat_type',
      serializers.serialize(object.vatType,
          specifiedType: const FullType(String)),
      'min',
      serializers.serialize(object.min, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EventDto deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = EventDtoBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'eventtime':
          result.eventTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total_seat':
          result.totalSeat = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'booked_seat':
          result.bookedSeat = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'available_seat':
          result.availableSeat = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vat':
          result.vat = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vat_type':
          result.vatType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'min':
          result.min = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EventDto extends EventDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String url;
  @override
  final String date;
  @override
  final String eventTime;
  @override
  final String address;
  @override
  final String totalSeat;
  @override
  final String bookedSeat;
  @override
  final String availableSeat;
  @override
  final String vat;
  @override
  final String vatType;
  @override
  final String min;

  factory _$EventDto([void Function(EventDtoBuilder)? updates]) =>
      (EventDtoBuilder()..update(updates))._build();

  _$EventDto._(
      {required this.id,
      required this.name,
      required this.image,
      required this.url,
      required this.date,
      required this.eventTime,
      required this.address,
      required this.totalSeat,
      required this.bookedSeat,
      required this.availableSeat,
      required this.vat,
      required this.vatType,
      required this.min})
      : super._();
  @override
  EventDto rebuild(void Function(EventDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventDtoBuilder toBuilder() => EventDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventDto &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        url == other.url &&
        date == other.date &&
        eventTime == other.eventTime &&
        address == other.address &&
        totalSeat == other.totalSeat &&
        bookedSeat == other.bookedSeat &&
        availableSeat == other.availableSeat &&
        vat == other.vat &&
        vatType == other.vatType &&
        min == other.min;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, eventTime.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, totalSeat.hashCode);
    _$hash = $jc(_$hash, bookedSeat.hashCode);
    _$hash = $jc(_$hash, availableSeat.hashCode);
    _$hash = $jc(_$hash, vat.hashCode);
    _$hash = $jc(_$hash, vatType.hashCode);
    _$hash = $jc(_$hash, min.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventDto')
          ..add('id', id)
          ..add('name', name)
          ..add('image', image)
          ..add('url', url)
          ..add('date', date)
          ..add('eventTime', eventTime)
          ..add('address', address)
          ..add('totalSeat', totalSeat)
          ..add('bookedSeat', bookedSeat)
          ..add('availableSeat', availableSeat)
          ..add('vat', vat)
          ..add('vatType', vatType)
          ..add('min', min))
        .toString();
  }
}

class EventDtoBuilder implements Builder<EventDto, EventDtoBuilder> {
  _$EventDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _eventTime;
  String? get eventTime => _$this._eventTime;
  set eventTime(String? eventTime) => _$this._eventTime = eventTime;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _totalSeat;
  String? get totalSeat => _$this._totalSeat;
  set totalSeat(String? totalSeat) => _$this._totalSeat = totalSeat;

  String? _bookedSeat;
  String? get bookedSeat => _$this._bookedSeat;
  set bookedSeat(String? bookedSeat) => _$this._bookedSeat = bookedSeat;

  String? _availableSeat;
  String? get availableSeat => _$this._availableSeat;
  set availableSeat(String? availableSeat) =>
      _$this._availableSeat = availableSeat;

  String? _vat;
  String? get vat => _$this._vat;
  set vat(String? vat) => _$this._vat = vat;

  String? _vatType;
  String? get vatType => _$this._vatType;
  set vatType(String? vatType) => _$this._vatType = vatType;

  String? _min;
  String? get min => _$this._min;
  set min(String? min) => _$this._min = min;

  EventDtoBuilder();

  EventDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _image = $v.image;
      _url = $v.url;
      _date = $v.date;
      _eventTime = $v.eventTime;
      _address = $v.address;
      _totalSeat = $v.totalSeat;
      _bookedSeat = $v.bookedSeat;
      _availableSeat = $v.availableSeat;
      _vat = $v.vat;
      _vatType = $v.vatType;
      _min = $v.min;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventDto other) {
    _$v = other as _$EventDto;
  }

  @override
  void update(void Function(EventDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventDto build() => _build();

  _$EventDto _build() {
    final _$result = _$v ??
        _$EventDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'EventDto', 'id'),
          name:
              BuiltValueNullFieldError.checkNotNull(name, r'EventDto', 'name'),
          image: BuiltValueNullFieldError.checkNotNull(
              image, r'EventDto', 'image'),
          url: BuiltValueNullFieldError.checkNotNull(url, r'EventDto', 'url'),
          date:
              BuiltValueNullFieldError.checkNotNull(date, r'EventDto', 'date'),
          eventTime: BuiltValueNullFieldError.checkNotNull(
              eventTime, r'EventDto', 'eventTime'),
          address: BuiltValueNullFieldError.checkNotNull(
              address, r'EventDto', 'address'),
          totalSeat: BuiltValueNullFieldError.checkNotNull(
              totalSeat, r'EventDto', 'totalSeat'),
          bookedSeat: BuiltValueNullFieldError.checkNotNull(
              bookedSeat, r'EventDto', 'bookedSeat'),
          availableSeat: BuiltValueNullFieldError.checkNotNull(
              availableSeat, r'EventDto', 'availableSeat'),
          vat: BuiltValueNullFieldError.checkNotNull(vat, r'EventDto', 'vat'),
          vatType: BuiltValueNullFieldError.checkNotNull(
              vatType, r'EventDto', 'vatType'),
          min: BuiltValueNullFieldError.checkNotNull(min, r'EventDto', 'min'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
