
// ginagamit para maging reusable ang variable
class Resource { 
  const Resource({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
  });

  final String id;
  final String title;
  final String description;
  final double rating;
}
