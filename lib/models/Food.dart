class Food {
  final String name;
  final String image;
  final double rating;
  final String totalTime;

  Food({
    required this.name,
    required this.image,
    required this.rating,
    required this.totalTime,
  });

  factory Food.fromJson(dynamic json) {
    return Food(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }

  static List<Food> foodsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Food.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Food {name: $name, image: $image, rating: $rating, totalTime: $totalTime}';
  }
}
