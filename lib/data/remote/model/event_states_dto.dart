import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_states_dto.g.dart';

abstract class EventStatesDto
    implements Built<EventStatesDto, EventStatesDtoBuilder> {
  @BuiltValueField(wireName: 'today_booked')
  String get todayBooked;

  @BuiltValueField(wireName: 'today_revenue')
  String get todayRevenue;

  @BuiltValueField(wireName: 'total_booked')
  String get totalBooked;

  @BuiltValueField(wireName: 'total_revenue')
  String get totalRevenue;

  EventStatesDto._();

  static Serializer<EventStatesDto> get serializer =>
      _$eventStatesDtoSerializer;

  factory EventStatesDto([void Function(EventStatesDtoBuilder)? updates]) =
      _$EventStatesDto;
}
