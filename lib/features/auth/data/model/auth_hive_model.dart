import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 0) // Update this typeId according to your app
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String? location;
  @HiveField(5)
  final String skill;
  @HiveField(7)
  final String password;

  AuthHiveModel({
    String? id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.skill,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : id = '',
        name = '',
        email = '',
        phoneNumber = '',
        location = '',
        skill = '',
        password = '';

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      location: entity.location,
      skill: entity.skill,
      password: entity.password,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      location: location ?? '',
      skill: skill,
      password: password,
      image: '',
      // Removed extra comma
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        location,
        skill,
        password,
      ];
}
