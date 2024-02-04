import 'package:flutter/material.dart';
import 'package:postapp/product/constants/color_constants.dart';
import 'package:postapp/product/constants/font_constants.dart';

final class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.keyboardType, this.hintText});

  final TextEditingController? controller;

  final TextInputType? keyboardType;

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: FontConstants.inter,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConstants.defaultBlue, width: 2),
          borderRadius: BorderRadius.circular(17),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConstants.defaultBlue, width: 2),
          borderRadius: BorderRadius.circular(17),
        ),
        fillColor: const Color.fromRGBO(246, 246, 246,0.08),
        filled: true,
        hintStyle: const TextStyle(
          fontFamily: 'inter',
          fontWeight: FontWeight.bold,
          color: Color(0XFFBBBBBB),
        ),
        hintText: hintText,
      ),
    );
  }
}
