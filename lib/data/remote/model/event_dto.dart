import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_dto.g.dart';

abstract class EventDto implements Built<EventDto, EventDtoBuilder> {
  EventDto._();

  @BuiltValueField(wireName: "id")
  String get id;

  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "image")
  String get image;

  @BuiltValueField(wireName: "url")
  String get url;

  @BuiltValueField(wireName: "date")
  String get date;

  @BuiltValueField(wireName: "eventtime")
  String get eventTime;

  @BuiltValueField(wireName: "address")
  String get address;

  @BuiltValueField(wireName: "total_seat")
  String get totalSeat;

  @BuiltValueField(wireName: "booked_seat")
  String get bookedSeat;

  @BuiltValueField(wireName: "available_seat")
  String get availableSeat;

  @BuiltValueField(wireName: "vat")
  String get vat;

  @BuiltValueField(wireName: "vat_type")
  String get vatType;

  @BuiltValueField(wireName: "min")
  String get min;

  // double get booked => double.parse(bookedSeat);
  //
  // double get total => double.parse(totalSeat);

  // double get _diff => total - booked;

  double get percentage =>
      double.parse(bookedSeat) * 100 / double.parse(totalSeat);

  double get finalPer =>
      (percentage.isInfinite || percentage.isNaN ? 0 : percentage) / 100;

  static Serializer<EventDto> get serializer => _$eventDtoSerializer;

  factory EventDto([void Function(EventDtoBuilder)? updates]) = _$EventDto;
}
