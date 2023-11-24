import 'package:flutter_redux_bp/models/models.dart';
import 'package:flutter_redux_bp/reducers/auth/auth_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[authReducer]);
