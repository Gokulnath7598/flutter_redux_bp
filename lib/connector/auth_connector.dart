import 'package:flutter_redux_bp/actions/actions.dart';
import 'package:flutter_redux_bp/models/models.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

part 'auth_connector.g.dart';

typedef LoginWithPasswordAction = void Function(String mobile, String password);
typedef LogOutAction = void Function();

abstract class AuthViewModel
    implements Built<AuthViewModel, AuthViewModelBuilder> {
  factory AuthViewModel(
      [AuthViewModelBuilder Function(AuthViewModelBuilder builder)
          updates]) = _$AuthViewModel;

  AuthViewModel._();

  factory AuthViewModel.fromStore(Store<AppState> store) {
    return AuthViewModel((AuthViewModelBuilder b) {
      return b
        ..isLoading = store.state.isLoading
        ..isInitializing = store.state.isInitializing
        ..currentUser = store.state.currentUser?.toBuilder()
        ..loginWithPassword = (String mobile, String password) {
          store.dispatch(LoginWithPassword(mobile: mobile, password: password));
        }
        ..logOut = () {
          store.dispatch(LogOutUser());
        };
    });
  }

  LoginWithPasswordAction get loginWithPassword;

  LogOutAction get logOut;

  AppUser? get currentUser;

  bool get isLoading;

  bool get isInitializing;
}

class AuthConnector extends StatelessWidget {
  const AuthConnector({super.key, required this.builder});

  final ViewModelBuilder<AuthViewModel> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      builder: builder,
      converter: (Store<AppState> store) => AuthViewModel.fromStore(store),
    );
  }
}
