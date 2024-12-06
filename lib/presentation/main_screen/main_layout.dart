import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sql/context_extensions.dart';
import 'package:flutter_sql/presentation/main_screen/providers/product_controller.dart';
import 'package:flutter_sql/presentation/widgets/pages/products_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainLayout extends HookConsumerWidget {
  const MainLayout({super.key});

  void createProduct(WidgetRef ref, BuildContext context) async {
    await ref.read(productControllerProvider.notifier).addNewProduct();
    if (context.mounted) Navigator.of(context).pop();
  }

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
            data: (product) => ProductsPage(
              products: product,
              onCreateProduct: () => createProduct(ref, context),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          Center(
            child: Text(
              context.s.content_of_second_tab,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
