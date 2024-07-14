import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist.dart';
import 'package:spotify_clone/presentation/home/bloc/playlist_state.dart';
import 'package:spotify_clone/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  // Get news songs
  Future<void> getPlaylist() async {
    var songs = await serviceLocator<GetPlaylistUseCase>().call();

    songs.fold((l) {
      emit(PlaylistFailed());
    }, (data) {
      emit(PlaylistLoaded(songs: data));
    });
  }
}
