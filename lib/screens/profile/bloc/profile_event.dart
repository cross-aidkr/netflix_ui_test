import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const <dynamic>[]]) : super();
}

class GetProfile extends ProfileEvent{
  @override
  List<Object?> get props => [];
}

class SaveProfile extends ProfileEvent{
  final Profile profile;

  SaveProfile(this.profile);

  @override
  List<Object?> get props => [profile];
}
