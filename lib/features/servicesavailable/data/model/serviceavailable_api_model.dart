import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skillseek/features/servicesavailable/domain/entity/serviceavailable_entity.dart';

part 'serviceavailable_api_model.g.dart';

@JsonSerializable()
class ServiceApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String? userId; // ✅ Make userId nullable
  final String title;
  final String description;
  final List<String> skills;
  final String image;
  
  @JsonKey(fromJson: _fromJson, toJson: _toJson) // ✅ Convert JSON DateTime
  final DateTime createdAt;

  const ServiceApiModel({
    required this.id,
    this.userId, // ✅ Allow null values
    required this.title,
    required this.description,
    required this.skills,
    required this.image,
    required this.createdAt, // ✅ Use DateTime
  });

  // ✅ Convert API Model to Domain Entity
  ServiceEntity toEntity() {
    return ServiceEntity(
      id: id,
      userId: userId ?? "", // ✅ Convert null to an empty string
      title: title,
      description: description,
      skills: skills,
      image: image,
      createdAt: createdAt, // ✅ Convert DateTime to String
    );
  }

  /// ✅ JSON Serialization Methods for `createdAt`
  static DateTime _fromJson(String date) => DateTime.parse(date);
  static String _toJson(DateTime date) => date.toIso8601String();

  factory ServiceApiModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceApiModelToJson(this);

  @override
  List<Object?> get props => [id, userId, title, description, skills, image, createdAt];
}
