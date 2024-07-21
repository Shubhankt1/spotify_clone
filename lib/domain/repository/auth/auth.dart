import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';

abstract class AuthRepo {
  Future<Either> signup(CreateUser createUser);
  Future<Either> signin(SigninUser signinUser);
  Future<Either> getUser();
}
