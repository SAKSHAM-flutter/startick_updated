import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'guest_dto.g.dart';

abstract class GuestDto implements Built<GuestDto, GuestDtoBuilder> {
  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "status")
  String get status;

  int aTOZ(GuestDto other) {
    return name.toLowerCase().compareTo(other.name.toLowerCase());
  }

  int zTOA(GuestDto other) {
    return other.name.toLowerCase().compareTo(name.toLowerCase());
  }

  GuestDto._();

  static Serializer<GuestDto> get serializer => _$guestDtoSerializer;

  factory GuestDto([void Function(GuestDtoBuilder)? updates]) = _$GuestDto;
}
