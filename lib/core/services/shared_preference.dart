import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesHelper {
  final String _kCountryCodePrefs = "countryCode";
  final String _kCountryNamePrefs = "countryName";
  final String _loggedInUserId = '_loggedInUserId';
  final String _schoolCode = 'schoolCode';
  final String _photoUrl = 'photoUrl';
  final String _childIds = 'childIds';
  final String _parentsIds = 'parentsIds';

  //Method to save the _childIds of Parent
  Future<bool> setChildIds(String childIds) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool res = await preferences.setString(_childIds, childIds);
    print('Childs Id Saved ' + res.toString());
    return res;
  }

  //Method to retrive the _childIds of Parent
  Future<String> getChildIds() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String res = preferences.getString(_childIds) ?? 'N.A';
    print('Childs Id Retrived ' + res.toString());
    return res;
  }

  //Method to save the _childIds of Parent
  Future<bool> setParentsIds(String parentIds) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool res = await preferences.setString(_parentsIds, parentIds);
    print('Parents Id Saved ' + res.toString());
    return res;
  }

  //Method to retrive the _childIds of Parent
  Future<String> getParentsIds() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String res = preferences.getString(_parentsIds) ?? 'N.A';
    print('Parents Id Retrived ' + res.toString());
    return res;
  }

  //Method that saves the _loggedInUserPhotoUrl
  Future<bool> setLoggedInUserPhotoUrl(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_photoUrl, url);
    print('User Id Saved' + res.toString());
    return res;
  }

  //Method that return the _loggedInUserPhotoUrl
  Future<String> getLoggedInUserPhotoUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String res = prefs.getString(_photoUrl) ?? 'default';
    print('User photo url Retrived' + res.toString());
    return res;
  }

  //Method that saves the _loggedInUserId
  Future<bool> setLoggedInUserId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setString(_loggedInUserId, id);
    print('User Id Saved' + res.toString());
    return res;
  }

  //Method that return the _loggedInUserId
  Future<String> getLoggedInUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String res = prefs.getString(_loggedInUserId);
    print('User Id Retrived' + res.toString());
    return res;
  }

  // Method that returns the last selected country code
  Future<String> getSchoolCode() async {
    final SharedPreferences countryCodePrefs =
        await SharedPreferences.getInstance();

    String res = countryCodePrefs.getString(_schoolCode) ?? "";

    print('School Code Retrived : ' + res);

    return res.toUpperCase();
  }

  // Method that saves the last selected country code
  Future<bool> setSchoolCode(String schoolCode) async {
    final SharedPreferences countryCodePrefs =
        await SharedPreferences.getInstance();

    bool res =
        await countryCodePrefs.setString(_schoolCode, schoolCode.toUpperCase());

    print('School Code Saved : ' + res.toString());

    return res;
  }

  //Method to remove all the Sharedpreference details when Logging Out
  Future<bool> clearAllData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    bool res = await preferences.clear();
    print('User Data Cleared : ' + res.toString());

    return res;
  }

  // Method that returns the last selected country code
  Future<String> getCountryCode() async {
    final SharedPreferences countryCodePrefs =
        await SharedPreferences.getInstance();

    return countryCodePrefs.getString(_kCountryCodePrefs) ?? "IN";
  }

  // Method that saves the last selected country code
  Future<bool> setCountryCode(String countryCode) async {
    final SharedPreferences countryCodePrefs =
        await SharedPreferences.getInstance();

    return countryCodePrefs.setString(_kCountryCodePrefs, countryCode);
  }

  // Method that returns the last selected country name
  Future<String> getCountryName() async {
    final SharedPreferences countryNamePrefs =
        await SharedPreferences.getInstance();

    return countryNamePrefs.getString(_kCountryNamePrefs) ?? 'India';
  }

  // Method that saves the last selected country name
  Future<bool> setCountryName(String countryName) async {
    final SharedPreferences countryNamePrefs =
        await SharedPreferences.getInstance();

    return countryNamePrefs.setString(_kCountryNamePrefs, countryName);
  }
}