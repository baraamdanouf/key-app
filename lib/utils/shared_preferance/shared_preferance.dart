import 'package:shared_preferences/shared_preferences.dart';

class SaveDateInSharedPreference
{
  static late SharedPreferences sharedPreferences;

  static const keyToken = 'TOKEN';
  static const keyUserName = 'USER_NAME';
  static const keyTheming = 'DARK_THEME';
  static const keySearch = 'SEARCH_LIST';
  static const keyWishlist = 'WISH_LIST';

  static Future init() async => sharedPreferences = await SharedPreferences.getInstance();

  //region token
  static Future setToken (String token) async => await sharedPreferences.setString(keyToken, token);

  static String getToken () => sharedPreferences.getString(keyToken) ?? '';
  //endregion token

  //region user name
  static Future setUserName (String userName) async => await sharedPreferences.setString(keyUserName, userName);

  static String getUserName () => sharedPreferences.getString(keyUserName) ?? '';
  //endregion user name

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
