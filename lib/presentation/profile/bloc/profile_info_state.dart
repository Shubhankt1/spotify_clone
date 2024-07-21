import 'package:spotify_clone/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final User userEntity;

  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoFailed extends ProfileInfoState {}
