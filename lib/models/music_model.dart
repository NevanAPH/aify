
class MusicModel {
  final String id;
  final String title;
  final String? description;
  final List<String> tags;
  final String? image;

  MusicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
  });

  factory MusicModel.from(data) {
    return MusicModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      tags: List<String>.from(data['tags']),
      image: data['image'],
    );
  }
}