import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/repository/song/song_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register Authentication Firebase Service Class
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  // Register Song Firebase Service
  serviceLocator.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  // Register Authentication Repository Class
  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl());

  // Register Song Repository
  serviceLocator.registerSingleton<SongsRepo>(SongRepoImpl());

  // SignUp UseCase
  serviceLocator.registerSingleton<SignupUseCase>(SignupUseCase());

  // SignIn UseCase
  serviceLocator.registerSingleton<SigninUseCase>(SigninUseCase());

  // Get New Songs UseCase
  serviceLocator.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

  // Get Playlist UseCase
  serviceLocator.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
}
