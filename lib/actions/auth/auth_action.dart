import 'package:flutter_redux_bp/models/app_user.dart';

class CheckForUserInPrefs {}

//********************************* login-in ***********************************//
class LoginWithPassword {
  LoginWithPassword({this.mobile, this.password});

  final String? mobile;
  final String? password;
}

class SaveUser {
  SaveUser({this.userDetails});

  final AppUser? userDetails;
}

//***************************** log-out ***************************************//
class LogOutUser {}

//**************************** manage loading status *************************//
class SetLoader {
  SetLoader(this.isLoading);

  final bool isLoading;
}
