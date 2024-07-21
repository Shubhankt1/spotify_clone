import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signin(SigninUser signinUser) async {
    return await serviceLocator<AuthFirebaseService>().signin(signinUser);
  }

  @override
  Future<Either> signup(CreateUser createUser) async {
    return await serviceLocator<AuthFirebaseService>().signup(createUser);
  }

  @override
  Future<Either> getUser() async {
    return await serviceLocator<AuthFirebaseService>().getUser();
  }
}
