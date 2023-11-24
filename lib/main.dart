import 'dart:async';

import 'package:flutter_redux_bp/actions/auth/auth_action.dart';
import 'package:flutter_redux_bp/data/api/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_bp/data/app_repository.dart';
import 'package:flutter_redux_bp/data/preference_client.dart';
import 'package:flutter_redux_bp/middleware/middleware.dart';
import 'package:flutter_redux_bp/models/models.dart';
import 'package:flutter_redux_bp/reducers/reducers.dart';
import 'package:flutter_redux_bp/views/init_page.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final AppRepository repository = AppRepository(
      preferencesClient: PreferencesClient(prefs: prefs),
      config: ApiRoutes.apiConfig);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp(repository: repository));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required AppRepository repository})
      : store = Store<AppState>(
          reducer,
          middleware: middleware(repository),
          initialState: AppState.initState(),
        ),
        super(key: key);

  final Store<AppState> store;

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = widget.store;
    _init();
    WidgetsBinding.instance.addObserver(this);
  }

  void _init() {
    Future<void>.delayed(const Duration(seconds: 2), () {
      store.dispatch(CheckForUserInPrefs());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        navigatorKey: store.state.navigator,
        title: 'MyApp',
        home: const InitPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
