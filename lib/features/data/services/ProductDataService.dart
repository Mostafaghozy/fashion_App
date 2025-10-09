import 'package:e_commerce/features/data/models/productModel.dart';

class ProductDataService {
  static final List<Product> _allProducts = [
    // Favorite Products
    Product(
      id: '1',
      title: 'Green Long sleeve shirt',
      category: 'Women\'s wear',
      price: 25.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
    Product(
      id: '2',
      title: 'Stylish Winter Coat',
      category: 'Women\'s wear',
      price: 45.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: false,
    ),
    Product(
      id: '3',
      title: 'Summer Dress',
      category: 'Women\'s wear',
      price: 35.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
    Product(
      id: '4',
      title: 'Men\'s wear',
      category: 'Men\'s wear',
      price: 20.00,
      imageUrl: 'assets/modelMan1.png',
      isFavorite: false,
    ),
    Product(
      id: '5',
      title: 'Men\'s wear',
      category: 'Men\'s wear',
      price: 55.00,
      imageUrl: 'assets/modelMan2.png',
      isFavorite: false,
    ),
    // Horizontal Products
    Product(
      id: '6',
      title: 'Cotton long sleeve jacket',
      category: 'Women\'s wear',
      price: 26.00,
      imageUrl: 'assets/girl_h1.png',
      isFavorite: false,
    ),
    Product(
      id: '7',
      title: 'Elegant evening dress',
      category: 'Women\'s wear',
      price: 45.00,
      imageUrl: 'assets/girl_h2.png',
      isFavorite: false,
    ),
    Product(
      id: '8',
      title: 'Casual summer top',
      category: 'Women\'s wear',
      price: 22.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
    Product(
      id: '9',
      title: 'Classic denim jacket',
      category: 'Men\'s wear',
      price: 35.00,
      imageUrl: 'assets/girl_h2.png',
      isFavorite: false,
    ),
    Product(
      id: '10',
      title: 'Formal business shirt',
      category: 'Men\'s wear',
      price: 28.00,
      imageUrl: 'assets/girl_h1.png',
      isFavorite: false,
    ),
    Product(
      id: '11',
      title: 'Trendy hoodie',
      category: 'Men\'s wear',
      price: 42.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
    // Grid Products
    Product(
      id: '12',
      title: 'Women Bottoms Free sizes',
      category: 'Women\'s wear',
      price: 12.99,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
    Product(
      id: '13',
      title: 'party Frock #12',
      category: 'Women\'s wear',
      price: 46.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: false,
    ),
    Product(
      id: '14',
      title: 'Women\'s long sleve jacket',
      category: 'Women\'s wear',
      price: 26.00,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
    Product(
      id: '15',
      title: 'Men\'s long sleve jacket',
      category: 'Men\'s wear',
      price: 26.00,
      imageUrl: 'assets/modelMan1.png',
      isFavorite: false,
    ),
    Product(
      id: '16',
      title: 'Green Long sleve shirt',
      category: 'Men\'s wear',
      price: 25.00,
      imageUrl: 'assets/modelMan2.png',
      isFavorite: false,
    ),
    Product(
      id: '17',
      title: 'party Frock #12',
      category: 'Women\'s wear',
      price: 46.00,
      imageUrl: 'assets/modelGirl1.png',
      isFavorite: false,
    ),
    Product(
      id: '18',
      title: 'sos Women Trousers',
      category: 'Women\'s wear',
      price: 32.00,
      imageUrl: 'assets/modelGirl2.png',
      isFavorite: false,
    ),
    Product(
      id: '19',
      title: 'Women Bottoms Free sizes',
      category: 'Women\'s wear',
      price: 12.99,
      imageUrl: 'assets/modelGirl3.png',
      isFavorite: false,
    ),
  ];

  // Get products by category
  static List<Product> getFavoriteProducts() {
    return _allProducts.where((product) => product.isFavorite).toList();
  }

  static List<Product> getHorizontalProducts() {
    return _allProducts
        .where((product) => ['6', '7', '8'].contains(product.id))
        .toList();
  }

  static List<Product> getHorizontalProducts2() {
    return _allProducts
        .where((product) => ['9', '10', '11'].contains(product.id))
        .toList();
  }

  static List<Product> getGridProducts() {
    return _allProducts
        .where(
          (product) => [
            '12',
            '13',
            '14',
            '15',
            '16',
            '17',
            '18',
            '19',
          ].contains(product.id),
        )
        .toList();
  }

  // Toggle favorite status
  static void toggleFavorite(String productId) {
    final index = _allProducts.indexWhere((product) => product.id == productId);
    if (index != -1) {
      _allProducts[index] = _allProducts[index].copyWith(
        isFavorite: !_allProducts[index].isFavorite,
      );
    }
  }

  // Get all products
  static List<Product> getAllProducts() {
    return List.from(_allProducts);
  }

  // Search products by query
  static List<Product> searchProducts(String query) {
    if (query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    return _allProducts.where((product) {
      return product.title.toLowerCase().contains(lowercaseQuery) ||
          product.category.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  // Get products by category
  static List<Product> getProductsByCategory(String category) {
    return _allProducts
        .where(
          (product) => product.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }
}
