import 'package:aify/models/music_model.dart';
import 'package:aify/utils/theme.dart';
import 'package:flutter/material.dart';

class MusicCarousel extends StatelessWidget {
  final VoidCallback action;
  final MusicModel music;

  const MusicCarousel({
    super.key, 
    required this.action,
    required this.music
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
          enableFeedback: true,
          maximumSize: const Size(260, 160),
          padding: EdgeInsets.zero,
          backgroundColor: AppTheme.backgroundLightColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: music.image == null ? null : DecorationImage(
            image: NetworkImage(music.image!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(music.title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(height: 1.0),
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false),
            Text(music.description ?? 'No description.',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false)
          ],
        ),
      ),
    );
  }
}
