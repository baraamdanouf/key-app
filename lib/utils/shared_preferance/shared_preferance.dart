import 'package:shared_preferences/shared_preferences.dart';

class SaveDateInSharedPreference
{
  static late SharedPreferences sharedPreferences;

  static const keyToken = 'TOKEN';
  static const keyUserName = 'USER_NAME';
  static const keyDeviceId = 'DEVICE_ID';
  static const keySubjectId = 'SUBJECT_ID';
  static const keyCourseId = 'COURSE_ID';
  static const keySubjectName = 'SUBJECT_Name';
  static const keyTheming = 'DARK_THEME';
  static const keySearch = 'SEARCH_LIST';
  static const keyWishlist = 'WISH_LIST';
  static const keyYearSessionName = 'SESSION_YEAR';
  static const keyFacultyName = 'FACULTY_NAME';

  static Future init() async => sharedPreferences = await SharedPreferences.getInstance();

  //region token
  static Future setToken (String token) async => await sharedPreferences.setString(keyToken, token);

  static String getToken () => sharedPreferences.getString(keyToken) ?? '';
  //endregion token

  //region user name
  static Future setUserName (String userName) async => await sharedPreferences.setString(keyUserName, userName);

  static String getUserName () => sharedPreferences.getString(keyUserName) ?? '';
  //endregion user name

  //region device id
  static Future setDeviceId (String deviceId) async => await sharedPreferences.setString(keyDeviceId, deviceId);

  static String getDeviceId () => sharedPreferences.getString(keyDeviceId) ?? '';
  //endregion device id

  //region year-session name
  static Future setYearSessionName (String yearSessionName) async => await sharedPreferences.setString(keyYearSessionName, yearSessionName);

  static String getYearSessionName () => sharedPreferences.getString(keyYearSessionName) ?? '';
  //endregion year-session name

  //region faculty name
  static Future setFacultyName (String facultyName) async => await sharedPreferences.setString(keyFacultyName, facultyName);

  static String getFacultyName () => sharedPreferences.getString(keyFacultyName) ?? '';
  //endregion faculty name

  //region subject id
  static Future setSubjectId (String subjectId) async => await sharedPreferences.setString(keySubjectId, subjectId);

  static String getSubjectId () => sharedPreferences.getString(keySubjectId) ?? '';
  //endregion subject id

  //region subject name
    static Future setSubjectName (String subjectName) async => await sharedPreferences.setString(keySubjectName, subjectName);

    static String getSubjectName () => sharedPreferences.getString(keySubjectName) ?? '';
  //endregion subject name

  //region course id
  static Future setCourseId (String courseId) async => await sharedPreferences.setString(keyCourseId, courseId);

  static String getCourseId () => sharedPreferences.getString(keyCourseId) ?? '';
  //endregion subject id

  //region change theming
  static Future setTheming (bool darkTheme) async => await sharedPreferences.setBool(keyTheming, darkTheme);

  static bool getTheming () => sharedPreferences.getBool(keyTheming) ?? false;
  //endregion theming

  //region searches
  static Future setSearches (List<String> list) async => await sharedPreferences.setStringList(keySearch, list);

  static List<String> getSearches () => sharedPreferences.getStringList(keySearch) ?? [];

  static deleteAllSearches() => sharedPreferences.remove(keySearch);
  //endregion searches

  //region wishlist
  static Future setWishlist (List<String> wishlist) async => sharedPreferences.setStringList(keyWishlist,wishlist);

  static List<String> getWishlist () => sharedPreferences.getStringList(keyWishlist) ?? [];

  static deleteAllWishlist() => sharedPreferences.remove(keySearch);
  //endregion wishlist
}
