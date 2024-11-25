import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MyTextField extends StatelessWidget {
  final Widget prefixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.prefixIcon,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      onChanged: onChanged,
      cursorColor: green,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: 'Songs, albums or artists',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.4),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
