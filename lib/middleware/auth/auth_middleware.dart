import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_bp/actions/actions.dart';
import 'package:flutter_redux_bp/data/app_repository.dart';
import 'package:flutter_redux_bp/data/services/auth/auth_service.dart';
import 'package:flutter_redux_bp/models/models.dart';
import 'package:flutter_redux_bp/views/auth/login_page.dart';
import 'package:redux/redux.dart';
import '../../views/home/home_page.dart';

class AuthMiddleware {
  AuthMiddleware({required this.repository})
      : authService = repository.getService<AuthService>() as AuthService;

  final AppRepository repository;
  final AuthService authService;

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, CheckForUserInPrefs>(checkForUserInPrefs),
      TypedMiddleware<AppState, LoginWithPassword>(loginWithPassword),
      TypedMiddleware<AppState, LogOutUser>(logOutUser),
    ];
  }

  void checkForUserInPrefs(Store<AppState> store, CheckForUserInPrefs action,
      NextDispatcher next) async {
    store.dispatch(SetLoader(true));
    final AppUser? user = await repository.getUserFromPrefs();
    if (user != null) {
      store.dispatch(SaveUser(userDetails: user));
      store.state.navigator.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      store.dispatch(SaveUser(userDetails: null));
      store.state.navigator.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
    store.dispatch(SetLoader(false));
    next(action);
  }

  void loginWithPassword(Store<AppState> store, LoginWithPassword action,
      NextDispatcher next) async {
    try {
      store.dispatch(SetLoader(true));
      final Map<String, dynamic> objToApi = <String, dynamic>{
        'customer': <String, String>{
          'mobile': action.mobile ?? '',
          'password': action.password ?? '',
          'grant_type': 'password'
        }
      };
      final Map<String, dynamic>? response =
          await authService.loginWithPassword(objToApi: objToApi);
      final AppUser? user = response?['customer'];

      if (user != null) {
        repository.setUserPrefs(appUser: user);
        store.dispatch(SaveUser(userDetails: user));
        store.state.navigator.currentState!.pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      }
      store.dispatch(SetLoader(false));
    } on DioException catch (e) {
      store.dispatch(SetLoader(false));
      debugPrint('============ login error block ========== $e');
      return;
    } catch (e) {
      store.dispatch(SetLoader(false));
      debugPrint('============ login catch block ========== $e');
    }
    next(action);
  }

  //******************************** upload-file ********************************//

  void logOutUser(
      Store<AppState> store, LogOutUser action, NextDispatcher next) async {
    store.dispatch(SetLoader(true));
    repository.setUserPrefs(appUser: null);
    store.state.navigator.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        ModalRoute.withName('/'));
    store.dispatch(SaveUser(userDetails: null));
    store.dispatch(SetLoader(false));
    next(action);
  }
}
