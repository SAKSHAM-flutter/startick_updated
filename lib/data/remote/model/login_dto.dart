import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_dto.g.dart';

abstract class LoginDto implements Built<LoginDto, LoginDtoBuilder> {
  @BuiltValueField(wireName: "id")
  String get id;

  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "email")
  String get email;

  @BuiltValueField(wireName: "phone")
  String get phone;

  @BuiltValueField(wireName: "role")
  String get role;

  @BuiltValueField(wireName: "Profile")
  String? get profile;

  @BuiltValueField(wireName: "gender")
  String? get gender;

  @BuiltValueField(wireName: "position")
  String? get position;

  @BuiltValueField(wireName: "token")
  String get token;

  LoginDto._();

  static Serializer<LoginDto> get serializer => _$loginDtoSerializer;

  factory LoginDto([void Function(LoginDtoBuilder)? updates]) = _$LoginDto;
}
