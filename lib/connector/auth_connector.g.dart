// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_connector.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthViewModel extends AuthViewModel {
  @override
  final LoginWithPasswordAction loginWithPassword;
  @override
  final LogOutAction logOut;
  @override
  final AppUser? currentUser;
  @override
  final bool isLoading;
  @override
  final bool isInitializing;

  factory _$AuthViewModel([void Function(AuthViewModelBuilder)? updates]) =>
      (new AuthViewModelBuilder()..update(updates))._build();

  _$AuthViewModel._(
      {required this.loginWithPassword,
      required this.logOut,
      this.currentUser,
      required this.isLoading,
      required this.isInitializing})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loginWithPassword, r'AuthViewModel', 'loginWithPassword');
    BuiltValueNullFieldError.checkNotNull(logOut, r'AuthViewModel', 'logOut');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AuthViewModel', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isInitializing, r'AuthViewModel', 'isInitializing');
  }

  @override
  AuthViewModel rebuild(void Function(AuthViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthViewModelBuilder toBuilder() => new AuthViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is AuthViewModel &&
        loginWithPassword == _$dynamicOther.loginWithPassword &&
        logOut == _$dynamicOther.logOut &&
        currentUser == other.currentUser &&
        isLoading == other.isLoading &&
        isInitializing == other.isInitializing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, loginWithPassword.hashCode);
    _$hash = $jc(_$hash, logOut.hashCode);
    _$hash = $jc(_$hash, currentUser.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isInitializing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthViewModel')
          ..add('loginWithPassword', loginWithPassword)
          ..add('logOut', logOut)
          ..add('currentUser', currentUser)
          ..add('isLoading', isLoading)
          ..add('isInitializing', isInitializing))
        .toString();
  }
}

class AuthViewModelBuilder
    implements Builder<AuthViewModel, AuthViewModelBuilder> {
  _$AuthViewModel? _$v;

  LoginWithPasswordAction? _loginWithPassword;

  LoginWithPasswordAction? get loginWithPassword => _$this._loginWithPassword;

  set loginWithPassword(LoginWithPasswordAction? loginWithPassword) =>
      _$this._loginWithPassword = loginWithPassword;

  LogOutAction? _logOut;

  LogOutAction? get logOut => _$this._logOut;

  set logOut(LogOutAction? logOut) => _$this._logOut = logOut;

  AppUserBuilder? _currentUser;

  AppUserBuilder get currentUser =>
      _$this._currentUser ??= new AppUserBuilder();

  set currentUser(AppUserBuilder? currentUser) =>
      _$this._currentUser = currentUser;

  bool? _isLoading;

  bool? get isLoading => _$this._isLoading;

  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isInitializing;

  bool? get isInitializing => _$this._isInitializing;

  set isInitializing(bool? isInitializing) =>
      _$this._isInitializing = isInitializing;

  AuthViewModelBuilder();

  AuthViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loginWithPassword = $v.loginWithPassword;
      _logOut = $v.logOut;
      _currentUser = $v.currentUser?.toBuilder();
      _isLoading = $v.isLoading;
      _isInitializing = $v.isInitializing;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthViewModel;
  }

  @override
  void update(void Function(AuthViewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthViewModel build() => _build();

  _$AuthViewModel _build() {
    _$AuthViewModel _$result;
    try {
      _$result = _$v ??
          new _$AuthViewModel._(
              loginWithPassword: BuiltValueNullFieldError.checkNotNull(
                  loginWithPassword, r'AuthViewModel', 'loginWithPassword'),
              logOut: BuiltValueNullFieldError.checkNotNull(
                  logOut, r'AuthViewModel', 'logOut'),
              currentUser: _currentUser?.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'AuthViewModel', 'isLoading'),
              isInitializing: BuiltValueNullFieldError.checkNotNull(
                  isInitializing, r'AuthViewModel', 'isInitializing'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currentUser';
        _currentUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
