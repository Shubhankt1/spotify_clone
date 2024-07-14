import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  // Get news songs
  Future<void> getNewsSongs() async {
    var songs = await serviceLocator<GetNewsSongsUseCase>().call();

    songs.fold((l) {
      emit(NewsSongsLoadFailed());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
