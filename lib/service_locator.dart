import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register Authentication Firebase Service Class
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  // Register Authentication Repository Class
  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl());

  // SignUp UseCase
  serviceLocator.registerSingleton<SignupUseCase>(SignupUseCase());

  // SignIn UseCase
  serviceLocator.registerSingleton<SigninUseCase>(SigninUseCase());
}
