import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:startick/data/remote/model/banner_dto.dart';
import 'package:startick/data/remote/model/coupan_history_dto.dart';
import 'package:startick/data/remote/model/event_dto.dart';
import 'package:startick/data/remote/model/event_states_dto.dart';
import 'package:startick/data/remote/model/guest_dto.dart';
import 'package:startick/data/remote/model/in_out_dto.dart';
import 'package:startick/data/remote/model/login_dto.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/remote/model/txn_dto.dart';
import 'package:startick/data/remote/model/unit_dto.dart';

part 'default_serializers.g.dart';

@SerializersFor([
  BannerDto,
  ResponseDto,
  CoupanHistoryDto,
  LoginDto,
  EventDto,
  GuestDto,
  EventStatesDto,
  InOutDto,
  UnitDto,
  TxnDto,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
