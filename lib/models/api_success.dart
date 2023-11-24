import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_redux_bp/models/models.dart';

part 'api_success.g.dart';

abstract class ApiSuccess implements Built<ApiSuccess, ApiSuccessBuilder> {
  factory ApiSuccess(
          [ApiSuccessBuilder Function(ApiSuccessBuilder builder) updates]) =
      _$ApiSuccess;

  ApiSuccess._();

  int? get status;

  String? get message;

  AccessToken? get token;

  @BuiltValueField(wireName: 'customer')
  AppUser? get user;

  static Serializer<ApiSuccess> get serializer => _$apiSuccessSerializer;
}
