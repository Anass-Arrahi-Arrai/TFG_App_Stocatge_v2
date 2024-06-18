import 'package:app_stocatge/models/user.dart';
import 'package:hive/hive.dart';
// Asegúrate de importar tu modelo de usuario

class UserRepository {
  late Box<User> userBox;

  UserRepository() {
    init();
  }

  void init() async {
    userBox = Hive.box<User>('userBox');
    if(userBox.isEmpty){
      User defaultUser = User(userName: "Unknown", fiscalName: "Unknown", nif: "Unknown", address: "Unknown", email: "Unknown");
      userBox.add(defaultUser);
    }
  }


  User? getUser() {
    if (userBox.isNotEmpty) {
      return userBox.getAt(0);
    }
    return null;
  }

  void saveUser(User user) {
    userBox.putAt(0, user);
  }

  void updateUser(User user) {
    if (userBox.isNotEmpty) {
      userBox.putAt(0, user);
    } else {
      saveUser(user);
    }
  }
}
