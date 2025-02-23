import 'package:equatable/equatable.dart';

abstract class ServiceProviderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchServiceProviders extends ServiceProviderEvent {
  final String? skill;

  FetchServiceProviders({this.skill});

  @override
  List<Object?> get props => [skill];
}
