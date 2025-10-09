class SearchHistoryService {
  static final List<String> _recentSearches = [
    'Silk sarees',
    'Top jacket',
    'Women\'s denims',
    'Shorts',
    'Party dresses',
    'Long sleeve',
  ];

  static List<String> getRecentSearches() {
    return List.from(_recentSearches);
  }

  static void addSearch(String query) {
    if (query.trim().isNotEmpty && !_recentSearches.contains(query)) {
      _recentSearches.insert(0, query);
      // Keep only the last 10 searches
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }
    }
  }

  static void clearAllSearches() {
    _recentSearches.clear();
  }

  static void removeSearch(String query) {
    _recentSearches.remove(query);
  }
}
