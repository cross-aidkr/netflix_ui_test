import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class AuthState extends Equatable{
  AuthState([List props = const <dynamic>[]]) : super();
}

class Empty extends AuthState {
  @override
  List<Object?> get props => [];
}

class Loading extends AuthState{
  @override
  List<Object?> get props => [];
}

class LoadedAuth extends AuthState{
  final Profile profile;

  LoadedAuth({
    required this.profile
  }) : super();

  @override
  List<Object?> get props => [profile];
}

// test 용
class LoadedAuth2 extends AuthState{
  final Profile profile;
  final int count;

  LoadedAuth2({
    required this.profile,
    required this.count
  }) : super();

  @override
  List<Object?> get props => [profile, count];
}

class Error extends AuthState{
  final String message;

  Error({
    required this.message
  }) : super();

  @override
  List<Object?> get props => [message];
}