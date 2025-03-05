// user_event.dart

abstract class UserEvent {}

class ProximitySensorEvent extends UserEvent {
  final double proximity;

  ProximitySensorEvent(this.proximity); // Pass proximity data
}
