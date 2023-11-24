import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  factory AppUser([AppUserBuilder Function(AppUserBuilder builder) updates]) =
      _$AppUser;

  AppUser._();

  @BuiltValueField(wireName: 'id')
  int? get userId;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  String? get email;

  String? get mobile;

  String? get gender;

  String? get dob;

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}
