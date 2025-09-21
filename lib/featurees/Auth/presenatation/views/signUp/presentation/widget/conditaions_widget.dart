import 'package:flutter/material.dart';
import 'custom_checkbox.dart';

class ConditaionsWidget extends StatefulWidget {
  final void Function(bool)? onChanged; // إرسال القيمة للوالد

  const ConditaionsWidget({super.key, this.onChanged});

  @override
  State<ConditaionsWidget> createState() => _ConditaionsWidgetState();
}

class _ConditaionsWidgetState extends State<ConditaionsWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckbox(
          isCheckbox: isTermsAccepted,
          onchanged: (value) {
            setState(() => isTermsAccepted = value);
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            "I agree to terms and conditions",
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
