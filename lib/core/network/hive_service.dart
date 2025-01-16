import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skillseek/app/constants/hive_table_constant.dart';
import 'package:skillseek/features/auth/data/model/auth_hive_model.dart';

class HiveService {
  static Future<void> init() async {
    // Initialize Hive
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/user.db';

    Hive.init(path);

    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.authBox);
    await box.put(auth.userId, auth);
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.authBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.authBox);
    return box.values.toList();
  }

  // Login using username and password
  Future<AuthHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.authBox);
    var auth = box.values.firstWhere(
        (element) =>
            element.username == username && element.password == password,
        orElse: () => const AuthHiveModel.initial());
    return auth;
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.authBox);
  }

  Future<void> clearauthBox() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.authBox);
  }

  Future<void> close() async {
    await Hive.close();
  }
}
