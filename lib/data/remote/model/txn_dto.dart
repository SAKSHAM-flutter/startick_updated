import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'txn_dto.g.dart';

abstract class TxnDto implements Built<TxnDto, TxnDtoBuilder> {
  @BuiltValueField(wireName: "customer_name")
  String get customerName;

  @BuiltValueField(wireName: "confirmation_code ")
  String get code;

  @BuiltValueField(wireName: "event_name")
  String get eventName;

  @BuiltValueField(wireName: "event_datetime")
  String get eventDatetime;

  @BuiltValueField(wireName: "event_venue")
  String get eventVenue;

  @BuiltValueField(wireName: "tickets")
  String get tickets;

  TxnDto._();

  static Serializer<TxnDto> get serializer => _$txnDtoSerializer;

  factory TxnDto([void Function(TxnDtoBuilder)? updates]) = _$TxnDto;
}
