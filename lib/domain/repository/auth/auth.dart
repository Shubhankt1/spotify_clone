import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';

abstract class AuthRepo {
  Future<Either> signup(CreateUser createUser);
  Future<void> signin();
}
