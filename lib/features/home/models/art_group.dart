
class ArtGroup {
  final String name;
  final String category;
  final String imageUrl;
  bool isFavorite;

  ArtGroup({
    required this.name,
    required this.category,
    required this.imageUrl,
    this.isFavorite = false,
  });
}