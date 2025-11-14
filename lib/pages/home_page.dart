
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/provider/app_provider.dart';
import 'package:storeapp/theme/color.dart';
import 'package:storeapp/theme/font.dart';
import 'package:storeapp/widgets/container_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().fetchProducts();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isLoading = provider.isLoading;
    final allCategories = provider.allCategories.toList();
    final displayedProducts = provider.filteredProducts;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'My Store',
          style: UIFontStyle.titleLargeBlack.copyWith(
            color: Colors.grey.shade800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset('assets/notif.png', height: 20),
            ),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: AppColors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                provider.setSearchQuery(value);
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories', style: UIFontStyle.headingLargeBlue,),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          label: Text('All'),
                          selected: provider.selectedCategory == null,
                          onSelected: (selected) {
                            provider.setSelectedCategory(selected ? null : 'All');
                          },
                          selectedColor: AppColors.blue,
                          labelStyle: TextStyle(
                            color: provider.selectedCategory == null ? Colors.white : Colors.black,
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                      for (String category in allCategories)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            label: Text(category),
                            selected: provider.selectedCategory == category,
                            onSelected: (selected) {
                              provider.setSelectedCategory(selected ? category : null);
                            },
                            selectedColor: AppColors.blue,
                            labelStyle: TextStyle(
                              color: provider.selectedCategory == category ? Colors.white : Colors.black,
                            ),
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : displayedProducts.isEmpty
                ? const Center(child: Text('No products found.'))
                : ListView.builder(
              itemCount: (displayedProducts.length / 2).ceil(),
              itemBuilder: (context, index) {
                final item1 = displayedProducts[index * 2];
                final item2 = (index * 2 + 1 < displayedProducts.length)
                    ? displayedProducts[index * 2 + 1]
                    : null;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: ContainerItem(
                          product: item1,
                          itemImage: item1.image,
                          itemName: item1.title,
                          itemPrice: item1.price.toStringAsFixed(2),
                          itemRate: item1.rating.rate.toStringAsFixed(1),
                        ),
                      ),
                      if (item2 != null)
                        Expanded(
                          child: ContainerItem(
                            product: item2,
                            itemImage: item2.image,
                            itemName: item2.title,
                            itemPrice: item2.price.toStringAsFixed(2),
                            itemRate: item2.rating.rate.toStringAsFixed(1),
                          ),
                        )
                      else
                        const Spacer(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}