import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: 'userId')
  final String? userId;
  final String username;
  final String email;
  final String phoneNumber;
  final String? address;
  final String role;
  final String skill;
  final String password;
  final String confirmPassword;
  final String imageName;

  const AuthApiModel({
    this.userId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.role,
    required this.skill,
    required this.password,
    required this.confirmPassword,
    required this.imageName,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  //to Entity
  AuthEntity toEntity() => AuthEntity(
        userId: userId,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        role: role,
        skill: skill,
        password: password,
        confirmPassword: confirmPassword,
        imageName: imageName,
      );

  //from Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) => AuthApiModel(
        userId: entity.userId,
        username: entity.username,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        address: entity.address,
        role: entity.role,
        skill: entity.skill,
        password: entity.password,
        confirmPassword: entity.confirmPassword,
        imageName: entity.imageName,
      );

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        phoneNumber,
        address,
        role,
        skill,
        password,
        confirmPassword,
        imageName,
      ];
}
