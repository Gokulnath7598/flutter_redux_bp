import 'package:flutter_redux_bp/actions/actions.dart';
import 'package:flutter_redux_bp/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> authReducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, SaveUser>(setUser),
  TypedReducer<AppState, SetLoader>(setLoader),
  TypedReducer<AppState, LogOutUser>(logOutUser),
]);

AppState setLoader(AppState state, SetLoader action) {
  final AppStateBuilder b = state.toBuilder();
  b.isLoading = action.isLoading;
  return b.build();
}

AppState logOutUser(AppState state, LogOutUser action) {
  final AppStateBuilder b = state.toBuilder();
  b
    ..isInitializing = false
    ..currentUser = null;
  return b.build();
}

AppState setUser(AppState state, SaveUser action) {
  final AppStateBuilder b = state.toBuilder();
  b.currentUser = action.userDetails?.toBuilder();
  return b.build();
}
