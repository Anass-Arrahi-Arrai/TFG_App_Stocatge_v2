import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 7)
class User {
  @HiveField(0)
  final String userName;

  @HiveField(1)
  final String fiscalName;

  @HiveField(2)
  final String nif;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final String email;

  User({
    required this.userName,
    required this.fiscalName,
    required this.nif,
    required this.address,
    required this.email,
  });
}
