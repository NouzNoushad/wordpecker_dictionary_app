import 'package:flutter/material.dart';

import '../core/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  const CustomTextField({super.key, this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      style: const TextStyle(
        color: CustomColors.backgroundColor2,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: CustomColors.backgroundColor),
          prefixIcon: const Icon(
            Icons.search,
            color: CustomColors.backgroundColor,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 1.5, color: CustomColors.backgroundColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 1.5, color: CustomColors.backgroundColor))),
    );
  }
}
