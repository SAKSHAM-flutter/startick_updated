import 'package:shared_preferences/shared_preferences.dart';

///Singleton class for accessing shared prefs, it contains all the key value fields to be saved in the app
class Prefs {
  static late SharedPreferences prefs;

  ///must call this function before performing any shared prefs related operations
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static final logging = SharedPrefValue<bool>('_logging', prefs);
  static final userType = SharedPrefValue<int>('_user_type', prefs);
  static final baseUrl = SharedPrefValue<String>('_base_url', prefs);
  static final authToken = SharedPrefValue<String>('_auth_token', prefs);
  static final email = SharedPrefValue<String>('_email', prefs);
  static final phone = SharedPrefValue<String>('_phone', prefs);
  static final profile = SharedPrefValue<String>('_profile', prefs);
  static final name = SharedPrefValue<String>('_name', prefs);
  static final role = SharedPrefValue<String>('_gender', prefs);
  static final gender = SharedPrefValue<String>('_role', prefs);
  static final position = SharedPrefValue<String>('_position', prefs);
  static final id = SharedPrefValue<String>('_id', prefs);

  static void clear() {
    prefs.clear();
  }
}

///Encapsulates getting and setting of Shared pref values.
class SharedPrefValue<T> {
  final String key;
  final SharedPreferences prefs;

  SharedPrefValue(this.key, this.prefs);

  ///Sets a value to the key provided in constructor
  void set(T value) {
    switch (T) {
      case const (int):
        prefs.setInt(key, value as int);
        break;
      case const (String):
        prefs.setString(key, value as String);
        break;
      case const (bool):
        prefs.setBool(key, value as bool);
        break;
    }
  }

  ///Returns the value from Shared Preferences if present,
  ///and returns null otherwise
  T? getSafe() {
    return prefs.get(key) as T?;
  }

  ///Returns value from Shared Preferences if present,
  ///and returns a default value otherwise.
  ///Default values for different data types:
  ///int -> -1,
  ///String -> "",
  ///bool -> false,
  T get() {
    return getSafe() ?? _getDefaultValues();
  }

  T _getDefaultValues() {
    switch (T) {
      case const (int):
        return -1 as T;
      case const (String):
        return "" as T;
      case const (bool):
        return false as T;
      default:
        throw Exception('Unrecognized Type T');
    }
  }

  ///Removes value from Shared Preferences
  void clear() {
    prefs.remove(key);
  }
}
