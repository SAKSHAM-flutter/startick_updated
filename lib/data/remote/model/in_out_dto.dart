import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'in_out_dto.g.dart';

abstract class InOutDto implements Built<InOutDto, InOutDtoBuilder> {
  @BuiltValueField(wireName: 'total_seat')
  String get totalSeat;

  @BuiltValueField(wireName: 'total_in')
  String get totalIn;

  double get percentage =>
      (double.parse(totalIn) * 100) / double.parse(totalSeat);

  double get finalPer =>
      (percentage.isInfinite || percentage.isNaN ? 0 : percentage) / 100;

  InOutDto._();

  static Serializer<InOutDto> get serializer => _$inOutDtoSerializer;

  factory InOutDto([void Function(InOutDtoBuilder)? updates]) = _$InOutDto;
}
