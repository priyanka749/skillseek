import 'package:equatable/equatable.dart';

abstract class ServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ✅ Event to fetch all services
class FetchServices extends ServiceEvent {}
