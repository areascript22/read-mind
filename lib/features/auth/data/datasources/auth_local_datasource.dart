import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource{
  Future<String?> getJwt();
  Future<void> saveJwt(String jwt);
  Future<void> clearJwt();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPrefs;
  final String jwtKey = 'jwt_token';

  AuthLocalDataSourceImpl(this.sharedPrefs);

  @override
  Future<void> saveJwt(String jwt) async {
    print("Saving jwt");
    await sharedPrefs.setString(jwtKey, jwt);
  }

  @override
  Future<String?> getJwt() async {
    print("getting jwt");
    return sharedPrefs.getString(jwtKey);
  }

  @override
  Future<void> clearJwt() async {
    print("Cleaning jwt");
    await sharedPrefs.remove(jwtKey);
  }
}
