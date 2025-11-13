import 'package:appp/featurees/main_screens/productdetails/data/model/extra_option_item_model.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProductExtraOptions extends StatelessWidget {
  final List<ExtraOptionItemModel> options;
  const ProductExtraOptions({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Extra Options", style: AppStyles.titleLora18),
        const SizedBox(height: 8),
        Column(
          children: options.map((opt) {
            return ValueListenableBuilder<bool>(
              valueListenable: opt.isChecked,
              builder: (_, value, __) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: value,
                        activeColor: AppColors.iconColorlight,
                        onChanged: (v) => opt.isChecked.value = v!,
                      ),
                      Text(opt.label, style: AppStyles.textInter14Gray),
                    ],
                  ),
                  Text(
                    "\$${opt.price.toStringAsFixed(2)}",
                    style: AppStyles.textInter14Gray,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
