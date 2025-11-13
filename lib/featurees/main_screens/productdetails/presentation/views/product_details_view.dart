import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/product_model.dart';
import '../cubit/product_details_cubit.dart';
import '../widgets/product_details_bloc_consumer.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView({super.key, required this.product});

  static const routeName = "ProductDetailsView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(product),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: ProductDetailsBlocConsumer()),
      ),
    );
  }
}
