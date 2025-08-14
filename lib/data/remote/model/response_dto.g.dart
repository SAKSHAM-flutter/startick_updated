// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseDto<Object?>> _$responseDtoSerializer =
    _$ResponseDtoSerializer();

class _$ResponseDtoSerializer
    implements StructuredSerializer<ResponseDto<Object?>> {
  @override
  final Iterable<Type> types = const [ResponseDto, _$ResponseDto];
  @override
  final String wireName = 'ResponseDto';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ResponseDto<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterDATA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
      'ResponseMessage',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'Succeeded',
      serializers.serialize(object.isSuccessful,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('ResponseBody')
        ..add(serializers.serialize(value, specifiedType: parameterDATA));
    }
    value = object.baseUrl;
    if (value != null) {
      result
        ..add('base_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userType;
    if (value != null) {
      result
        ..add('user_type')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ResponseDto<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterDATA =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? ResponseDtoBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as ResponseDtoBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'ResponseMessage':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'Succeeded':
          result.isSuccessful = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'ResponseBody':
          result.data =
              serializers.deserialize(value, specifiedType: parameterDATA);
          break;
        case 'base_url':
          result.baseUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseDto<DATA> extends ResponseDto<DATA> {
  @override
  final int status;
  @override
  final String message;
  @override
  final bool isSuccessful;
  @override
  final DATA? data;
  @override
  final String? baseUrl;
  @override
  final String? userId;
  @override
  final int? userType;
  @override
  final String? role;
  @override
  final bool? verified;

  factory _$ResponseDto([void Function(ResponseDtoBuilder<DATA>)? updates]) =>
      (ResponseDtoBuilder<DATA>()..update(updates))._build();

  _$ResponseDto._(
      {required this.status,
      required this.message,
      required this.isSuccessful,
      this.data,
      this.baseUrl,
      this.userId,
      this.userType,
      this.role,
      this.verified})
      : super._();
  @override
  ResponseDto<DATA> rebuild(void Function(ResponseDtoBuilder<DATA>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseDtoBuilder<DATA> toBuilder() =>
      ResponseDtoBuilder<DATA>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseDto &&
        status == other.status &&
        message == other.message &&
        isSuccessful == other.isSuccessful &&
        data == other.data &&
        baseUrl == other.baseUrl &&
        userId == other.userId &&
        userType == other.userType &&
        role == other.role &&
        verified == other.verified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, isSuccessful.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseDto')
          ..add('status', status)
          ..add('message', message)
          ..add('isSuccessful', isSuccessful)
          ..add('data', data)
          ..add('baseUrl', baseUrl)
          ..add('userId', userId)
          ..add('userType', userType)
          ..add('role', role)
          ..add('verified', verified))
        .toString();
  }
}

class ResponseDtoBuilder<DATA>
    implements Builder<ResponseDto<DATA>, ResponseDtoBuilder<DATA>> {
  _$ResponseDto<DATA>? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isSuccessful;
  bool? get isSuccessful => _$this._isSuccessful;
  set isSuccessful(bool? isSuccessful) => _$this._isSuccessful = isSuccessful;

  DATA? _data;
  DATA? get data => _$this._data;
  set data(DATA? data) => _$this._data = data;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  int? _userType;
  int? get userType => _$this._userType;
  set userType(int? userType) => _$this._userType = userType;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  ResponseDtoBuilder();

  ResponseDtoBuilder<DATA> get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _isSuccessful = $v.isSuccessful;
      _data = $v.data;
      _baseUrl = $v.baseUrl;
      _userId = $v.userId;
      _userType = $v.userType;
      _role = $v.role;
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseDto<DATA> other) {
    _$v = other as _$ResponseDto<DATA>;
  }

  @override
  void update(void Function(ResponseDtoBuilder<DATA>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseDto<DATA> build() => _build();

  _$ResponseDto<DATA> _build() {
    final _$result = _$v ??
        _$ResponseDto<DATA>._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ResponseDto', 'status'),
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ResponseDto', 'message'),
          isSuccessful: BuiltValueNullFieldError.checkNotNull(
              isSuccessful, r'ResponseDto', 'isSuccessful'),
          data: data,
          baseUrl: baseUrl,
          userId: userId,
          userType: userType,
          role: role,
          verified: verified,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
