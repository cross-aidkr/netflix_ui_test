import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  String sId;
  String imageUrl;
  String name;

  Profile({
    required this.sId,
    required this.imageUrl,
    required this.name,
  });

  @override
  List<Object?> get props => [sId, imageUrl, name];

}