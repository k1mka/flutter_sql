import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sql/context_extensions.dart';
import 'package:flutter_sql/presentation/main_screen/prodivers/product_controller.dart';
import 'package:flutter_sql/presentation/widgets/pages/products_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productControllerProvider);
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.product_screen),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: context.s.add_products),
            Tab(text: context.s.saved_products),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // TODO(George): path to presenter
          productsAsync.when(
            data: (products) =>
                ProductsPage(
                  products: products,
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          Center(
            child: Text(
              'Content of Second Tab',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}