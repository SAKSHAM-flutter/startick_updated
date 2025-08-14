import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_dto.g.dart';

abstract class ResponseDto<DATA>
    implements Built<ResponseDto<DATA>, ResponseDtoBuilder<DATA>> {
  @BuiltValueField(wireName: 'status')
  int get status;

  @BuiltValueField(wireName: 'ResponseMessage')
  String get message;

  @BuiltValueField(wireName: 'Succeeded')
  bool get isSuccessful;

  @BuiltValueField(wireName: 'ResponseBody')
  DATA? get data;

  @BuiltValueField(wireName: 'base_url')
  String? get baseUrl;

  @BuiltValueField(wireName: 'user_id')
  String? get userId;

  @BuiltValueField(wireName: 'user_type')
  int? get userType;

  @BuiltValueField(wireName: 'role')
  String? get role;

  @BuiltValueField(wireName: 'verified')
  bool? get verified;

  ResponseDto._();

  static Serializer<ResponseDto> get serializer => _$responseDtoSerializer;

  factory ResponseDto([void Function(ResponseDtoBuilder<DATA>)? updates]) =
      _$ResponseDto<DATA>;
}
