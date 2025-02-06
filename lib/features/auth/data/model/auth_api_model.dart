import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skillseek/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String email;
  final String phoneNumber;
  final String name;
  final String location;
  final String skill;
  final String password;
  final String image;

  const AuthApiModel({
    this.id,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.skill,
    required this.name,
    required this.password,
    required this.image,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  //to Entity
  AuthEntity toEntity() => AuthEntity(
        id: id,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        location: location,
        skill: skill,
        password: password,
        image: image,
      );

  //from Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) => AuthApiModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        location: entity.location,
        skill: entity.skill,
        password: entity.password,
        image: entity.image,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        location,
        skill,
        password,
        image,
      ];
}
