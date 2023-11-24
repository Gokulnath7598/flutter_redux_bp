// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final GlobalKey<NavigatorState> navigator;
  @override
  final AppUser? currentUser;
  @override
  final bool isInitializing;
  @override
  final bool isLoading;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._(
      {required this.navigator,
      this.currentUser,
      required this.isInitializing,
      required this.isLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(navigator, r'AppState', 'navigator');
    BuiltValueNullFieldError.checkNotNull(
        isInitializing, r'AppState', 'isInitializing');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'AppState', 'isLoading');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        navigator == other.navigator &&
        currentUser == other.currentUser &&
        isInitializing == other.isInitializing &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, navigator.hashCode);
    _$hash = $jc(_$hash, currentUser.hashCode);
    _$hash = $jc(_$hash, isInitializing.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('navigator', navigator)
          ..add('currentUser', currentUser)
          ..add('isInitializing', isInitializing)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  GlobalKey<NavigatorState>? _navigator;

  GlobalKey<NavigatorState>? get navigator => _$this._navigator;

  set navigator(GlobalKey<NavigatorState>? navigator) =>
      _$this._navigator = navigator;

  AppUserBuilder? _currentUser;

  AppUserBuilder get currentUser =>
      _$this._currentUser ??= new AppUserBuilder();

  set currentUser(AppUserBuilder? currentUser) =>
      _$this._currentUser = currentUser;

  bool? _isInitializing;

  bool? get isInitializing => _$this._isInitializing;

  set isInitializing(bool? isInitializing) =>
      _$this._isInitializing = isInitializing;

  bool? _isLoading;

  bool? get isLoading => _$this._isLoading;

  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _navigator = $v.navigator;
      _currentUser = $v.currentUser?.toBuilder();
      _isInitializing = $v.isInitializing;
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              navigator: BuiltValueNullFieldError.checkNotNull(
                  navigator, r'AppState', 'navigator'),
              currentUser: _currentUser?.build(),
              isInitializing: BuiltValueNullFieldError.checkNotNull(
                  isInitializing, r'AppState', 'isInitializing'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'AppState', 'isLoading'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currentUser';
        _currentUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
