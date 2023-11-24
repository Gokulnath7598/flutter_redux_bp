import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_redux_bp/models/models.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState(
      [AppStateBuilder Function(AppStateBuilder builder) updates]) = _$AppState;

  AppState._();

  static AppState initState() {
    return AppState((AppStateBuilder b) {
      return b
        ..navigator = GlobalKey<NavigatorState>()
        ..isInitializing = true
        ..isLoading = false;
    });
  }

  GlobalKey<NavigatorState> get navigator;

  AppUser? get currentUser;

  bool get isInitializing;

  bool get isLoading;
}
