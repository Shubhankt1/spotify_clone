import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class SongRepoImpl extends SongsRepo {
  @override
  Future<Either> getNewsSongs() async {
    return await serviceLocator<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlaylist() async {
    return await serviceLocator<SongFirebaseService>().getPlaylist();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    return await serviceLocator<SongFirebaseService>()
        .addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await serviceLocator<SongFirebaseService>().isFavoriteSong(songId);
  }
}
