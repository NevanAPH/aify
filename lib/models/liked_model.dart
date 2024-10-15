
class LikedModel {
  final String id;
  bool liked = false;

  LikedModel({
    required this.id,
    required this.liked,
  });

  factory LikedModel.from(data) {
    return LikedModel(
      id: data['id'],
      liked: data['liked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'liked': liked,
    };
  }
}