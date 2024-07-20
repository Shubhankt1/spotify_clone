import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/config/constants/app_urls.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'Now Playing',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _songCoverHero(context),
          ],
        ),
      ),
    );
  }

  Widget _songCoverHero(BuildContext context) {
    return Hero(
      tag: '${songEntity.title}-${songEntity.artist}',
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              '${AppUrls.firestorage}${songEntity.title}.webp?${AppUrls.mediaAlt}',
            ),
          ),
        ),
      ),
    );
  }
}
