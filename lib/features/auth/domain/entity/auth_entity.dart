import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String location;
  final String skill;
  final String image;
  final String password;

  const AuthEntity({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.skill,
    required this.password,
    required this.image,
  });

  const AuthEntity.empty()
      : id = null,
        name = '',
        email = '',
        phoneNumber = '',
        location = '',
        skill = '',
        password = '',
        image = '';

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        skill,
        location,
        password,
        image,
      ];
}
