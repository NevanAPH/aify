
import 'package:aify/models/liked_model.dart';

class MusicModel extends LikedModel {
  final String title;
  final String? description;
  final List<String> tags;
  final String? image;

  MusicModel({
    required String id,
    required bool liked,
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
  }) : super(id: id, liked: liked);

  factory MusicModel.from(data) {
    return MusicModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      tags: List<String>.from(data['tags']),
      image: data['image'],
      liked: data['liked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tags': tags,
      'image': image,
      'liked': liked,
    };
  }
}