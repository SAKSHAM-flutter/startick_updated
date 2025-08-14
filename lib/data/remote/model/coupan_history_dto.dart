import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'coupan_history_dto.g.dart';

abstract class CoupanHistoryDto
    implements Built<CoupanHistoryDto, CoupanHistoryDtoBuilder> {
  CoupanHistoryDto._();

  @BuiltValueField(wireName: "coupon_id")
  int get couponId;

  @BuiltValueField(wireName: "scan_time")
  String? get scanTime;

  @BuiltValueField(wireName: "organiser_name")
  String? get organiserName;
  @BuiltValueField(wireName: "coupon_name")
  String get couponName;
  @BuiltValueField(wireName: "count")
  int? get count;

  String timeAgoFromString() {
    if (scanTime == null) return " s";
    final date = DateTime.parse(scanTime!);
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} seconds ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hours ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays < 30) {
      int weeks = (diff.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 365) {
      int months = (diff.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else {
      int years = (diff.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    }
  }

  static Serializer<CoupanHistoryDto> get serializer =>
      _$coupanHistoryDtoSerializer;

  factory CoupanHistoryDto([void Function(CoupanHistoryDtoBuilder)? updates]) =
      _$CoupanHistoryDto;
}
