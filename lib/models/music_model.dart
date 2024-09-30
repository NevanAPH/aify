
class MusicModel {
  final String uuid;
  final String title;
  final String description;
  final List<String> tags;
  final String image;

  MusicModel({
    required this.uuid,
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
  });

  factory MusicModel.from(data) {
    return MusicModel(
      uuid: data['uuid'],
      title: data['title'],
      description: data['description'],
      tags: List<String>.from(data['tags']),
      image: data['image'],
    );
  }
}