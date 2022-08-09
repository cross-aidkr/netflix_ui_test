import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const <dynamic>[]]) : super();
}

class GetAuth extends AuthEvent{
  final Profile profile;

  GetAuth(this.profile);

  @override
  List<Object?> get props => [profile];
}

// Test 용 Event
class Get2Auth extends AuthEvent{
  final Profile profile;

  Get2Auth(this.profile);

  @override
  List<Object?> get props => [profile];
}
