import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/config/constants/app_urls.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
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
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _songCoverHero(context),
            _songDetail(context),
          ],
        ),
      ),
    );
  }

  Widget _songCoverHero(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Hero(
      tag: '${songEntity.title}-${songEntity.artist}',
      child: Center(
        child: SizedBox(
          height: width > 450
              ? height > 650
                  ? height / 2
                  : height / 1.5
              : width > 315
                  ? height / 2
                  : height / 2.5,
          // height: 430,
          // width: width > 630 ? width / 2 : width,
          width: width < 800 ? 650 : 550,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                image: NetworkImage(
                  '${AppUrls.firestorage}${songEntity.title}.webp?${AppUrls.mediaAlt}',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _songDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              songEntity.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_rounded,
            color: AppColors.darkGrey,
            size: 35,
          ),
        ),
      ],
    );
  }
}
