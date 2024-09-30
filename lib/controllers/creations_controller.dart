import 'package:aify/models/music_model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class CreationsController extends GetxController {

  final my_creations = [].obs;
  final my_favorites = [].obs;
  final now_trending = [].obs;
  final might_like = [].obs;
  final explore_new = [].obs;
  final creator_picks = [].obs;

  final my_creations_loaded = false.obs;
  final my_favorites_loaded = false.obs;
  final now_trending_loaded = false.obs;
  final might_like_loaded = false.obs;
  final explore_new_loaded = false.obs;
  final creator_picks_loaded = false.obs;

  final SupabaseClient client = Supabase.instance.client;

  getNowTrending({ int? limit }) async {
    try {
      final res = await client.from('now_trendings').select('content:content_id (*)').limit(limit ?? 10);
      final List<MusicModel> trendingList = (res as List)
          .map((item) => MusicModel.from(item['content']))
          .toList();
      
      now_trending.value = trendingList;
      now_trending_loaded.value = true;

      return res;
    } catch (e) {
      return null;
    }
  }

  getMyCreations({ int? limit }) async {
    try {
      final res = await client.from('users_creations')
        .select().eq('user_id', client.auth.currentUser!.id).limit(limit ?? 5);
      final List<MusicModel> myList = (res as List)
          .map((item) => MusicModel.from(item))
          .toList();
      
      my_creations.value = myList;
      my_creations_loaded.value = true;

      return res;
    } catch (e) {
      return null;
    }
  }

}