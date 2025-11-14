
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class AppProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String url = 'https://fakestoreapi.com/products';


  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  List<Product> _filteredProducts = [];
  List<Product> get filteredProducts => _filteredProducts;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((json) => Product.fromJson(json)).toList();
        _filteredProducts = List.from(_products);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      debugPrint('Error fetching products: $e');
      _products = [];
      _filteredProducts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }

  Set<String> get allCategories {
    return _products.map((product) => product.category).toSet();
  }

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilters();
  }

  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  void setSelectedCategory(String? category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void _applyFilters() {
    List<Product> results = List.from(_products);

    if (_selectedCategory != null && _selectedCategory != 'All') {
      results = results.where((product) => product.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      results = results.where((product) =>
      product.title.toLowerCase().contains(_searchQuery) ||
          product.description.toLowerCase().contains(_searchQuery) ||
          product.category.toLowerCase().contains(_searchQuery)
      ).toList();
    }

    _filteredProducts = results;
    notifyListeners();
  }

  String getAutoCorrectSuggestion(String query) {
    if (query.isEmpty) return '';
    final titles = _products.map((p) => p.title.toLowerCase()).toSet();
    for (final title in titles) {
      if (title.contains(query.toLowerCase())) {
        return title;
      }
    }
    return '';
  }
}