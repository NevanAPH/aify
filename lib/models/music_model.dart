
class MusicModel {
  final String id;
  final String title;
  final String? description;
  final List<String> tags;
  final String? image;
  bool? isLiked = false;

  MusicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
    this.isLiked,
  });

  factory MusicModel.from(data) {
    return MusicModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      tags: List<String>.from(data['tags']),
      image: data['image'],
      isLiked: data['isLiked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tags': tags,
      'image': image,
      'isLiked': isLiked,
    };
  }
}