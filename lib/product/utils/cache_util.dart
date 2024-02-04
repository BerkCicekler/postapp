import 'package:hive/hive.dart';

final class CacheUtil {
  CacheUtil._();

  /// this method will save the email and password data in the device
  static Future<void> accountSave({
    required String email,
    required String password,
  }) async {
    final box = await Hive.openBox<List<String>>('account');
    await box.put(1, [email, password]);
  }

  /// this method will get the saved account email and password
  /// and return it into a List
  /// index 0 will be email
  /// index 1 will be password
  static Future<List<String>?> getSavedAccount() async {
    final box = await Hive.openBox<List<String>>('account');
    return box.get(1);
  }
}
