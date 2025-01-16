import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 0) // Update this typeId according to your app
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String? address;
  @HiveField(5)
  final String password;
  @HiveField(6)
  final String confirmPassword;

  AuthHiveModel({
    String? userId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.confirmPassword,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        username = '',
        email = '',
        phoneNumber = '',
        address = '',
        password = '',
        confirmPassword = '';

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      username: entity.username,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      password: entity.password,
      confirmPassword: entity.confirmPassword, // Removed extra comma
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      username: username,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      password: password,
      confirmPassword: confirmPassword, // Removed extra comma
    );
  }

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        phoneNumber,
        address,
        password,
        confirmPassword
      ];
}
