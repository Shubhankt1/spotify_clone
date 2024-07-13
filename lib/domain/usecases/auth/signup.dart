import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUser> {
  @override
  Future<Either> call({CreateUser? params}) async {
    return serviceLocator<AuthRepo>().signup(params!);
  }
}
