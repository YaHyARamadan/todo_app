import 'package:flutter/material.dart';
import '../../../../core/themes/color_theme.dart';

class CustomTextForm extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final int? maxNum;

  const CustomTextForm(
      {super.key,
        required this.title,
        required this.textEditingController,
        required this.textInputType,
        this.maxNum});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}
class _CustomTextFormState extends State<CustomTextForm> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode idFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              color: AppColor.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          focusNode: FocusNode(),
          controller: widget.textEditingController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Empty Valid';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            hintText: widget.title,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          keyboardType: widget.textInputType,
          maxLength: widget.maxNum,
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
