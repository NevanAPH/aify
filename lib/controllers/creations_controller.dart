import 'package:aify/controllers/like_controller.dart';
import 'package:aify/models/liked_model.dart';
import 'package:aify/models/music_model.dart';
import 'package:get/get.dart';

import 'package:aify/utils/music_data.dart';

class CreationsController extends LikeController {

  final my_creations = (creations as List)
          .map((item) => MusicModel.from(item))
          .toList();

  final now_trending = (nowTrending as List)
          .map((item) => MusicModel.from(item))
          .toList();
  
  final might_like = (mightLike as List)
          .map((item) => MusicModel.from(item))
          .toList();
  
  final explore_new = (exploreNew as List)
          .map((item) => MusicModel.from(item))
          .toList();
  
  final creator_picks = (creatorPicks as List)
          .map((item) => MusicModel.from(item))
          .toList();
}
