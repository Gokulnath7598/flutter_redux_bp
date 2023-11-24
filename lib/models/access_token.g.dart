// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccessToken> _$accessTokenSerializer = new _$AccessTokenSerializer();

class _$AccessTokenSerializer implements StructuredSerializer<AccessToken> {
  @override
  final Iterable<Type> types = const [AccessToken, _$AccessToken];
  @override
  final String wireName = 'AccessToken';

  @override
  Iterable<Object?> serialize(Serializers serializers, AccessToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accessToken;
    if (value != null) {
      result
        ..add('access_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refresh_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expiresIn;
    if (value != null) {
      result
        ..add('expires_in')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AccessToken deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccessTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'access_token':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refresh_token':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expires_in':
          result.expiresIn = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$AccessToken extends AccessToken {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final int? expiresIn;

  factory _$AccessToken([void Function(AccessTokenBuilder)? updates]) =>
      (new AccessTokenBuilder()..update(updates))._build();

  _$AccessToken._({this.accessToken, this.refreshToken, this.expiresIn})
      : super._();

  @override
  AccessToken rebuild(void Function(AccessTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccessTokenBuilder toBuilder() => new AccessTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccessToken &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        expiresIn == other.expiresIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, expiresIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccessToken')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('expiresIn', expiresIn))
        .toString();
  }
}

class AccessTokenBuilder implements Builder<AccessToken, AccessTokenBuilder> {
  _$AccessToken? _$v;

  String? _accessToken;

  String? get accessToken => _$this._accessToken;

  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;

  String? get refreshToken => _$this._refreshToken;

  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  int? _expiresIn;

  int? get expiresIn => _$this._expiresIn;

  set expiresIn(int? expiresIn) => _$this._expiresIn = expiresIn;

  AccessTokenBuilder();

  AccessTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _expiresIn = $v.expiresIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccessToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccessToken;
  }

  @override
  void update(void Function(AccessTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccessToken build() => _build();

  _$AccessToken _build() {
    final _$result = _$v ??
        new _$AccessToken._(
            accessToken: accessToken,
            refreshToken: refreshToken,
            expiresIn: expiresIn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
