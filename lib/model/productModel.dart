// product_model.dart
class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.isFavorite = true,
  });

  // Create a copy with modified fields
  Product copyWith({
    String? id,
    String? title,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
