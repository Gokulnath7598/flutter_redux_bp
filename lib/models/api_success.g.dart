// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiSuccess> _$apiSuccessSerializer = new _$ApiSuccessSerializer();

class _$ApiSuccessSerializer implements StructuredSerializer<ApiSuccess> {
  @override
  final Iterable<Type> types = const [ApiSuccess, _$ApiSuccess];
  @override
  final String wireName = 'ApiSuccess';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AccessToken)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AppUser)));
    }
    return result;
  }

  @override
  ApiSuccess deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token':
          result.token.replace(serializers.deserialize(value,
              specifiedType: const FullType(AccessToken))! as AccessToken);
          break;
        case 'customer':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppUser))! as AppUser);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiSuccess extends ApiSuccess {
  @override
  final int? status;
  @override
  final String? message;
  @override
  final AccessToken? token;
  @override
  final AppUser? user;

  factory _$ApiSuccess([void Function(ApiSuccessBuilder)? updates]) =>
      (new ApiSuccessBuilder()..update(updates))._build();

  _$ApiSuccess._({this.status, this.message, this.token, this.user})
      : super._();

  @override
  ApiSuccess rebuild(void Function(ApiSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiSuccessBuilder toBuilder() => new ApiSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSuccess &&
        status == other.status &&
        message == other.message &&
        token == other.token &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiSuccess')
          ..add('status', status)
          ..add('message', message)
          ..add('token', token)
          ..add('user', user))
        .toString();
  }
}

class ApiSuccessBuilder implements Builder<ApiSuccess, ApiSuccessBuilder> {
  _$ApiSuccess? _$v;

  int? _status;

  int? get status => _$this._status;

  set status(int? status) => _$this._status = status;

  String? _message;

  String? get message => _$this._message;

  set message(String? message) => _$this._message = message;

  AccessTokenBuilder? _token;

  AccessTokenBuilder get token => _$this._token ??= new AccessTokenBuilder();

  set token(AccessTokenBuilder? token) => _$this._token = token;

  AppUserBuilder? _user;

  AppUserBuilder get user => _$this._user ??= new AppUserBuilder();

  set user(AppUserBuilder? user) => _$this._user = user;

  ApiSuccessBuilder();

  ApiSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _token = $v.token?.toBuilder();
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiSuccess;
  }

  @override
  void update(void Function(ApiSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSuccess build() => _build();

  _$ApiSuccess _build() {
    _$ApiSuccess _$result;
    try {
      _$result = _$v ??
          new _$ApiSuccess._(
              status: status,
              message: message,
              token: _token?.build(),
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'token';
        _token?.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
