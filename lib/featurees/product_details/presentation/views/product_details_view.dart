import 'package:flutter/material.dart';

import '../widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const routeName = "productdetailsview";

  @override
  Widget build(BuildContext context) {
    return ProductDetailsViewBody();
  }
}
