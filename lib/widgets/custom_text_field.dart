import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onSuffixTap;
  final Color defaultBorderColor;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.onSuffixTap,
    this.defaultBorderColor = const Color(0xFFE0E0E0), 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 18),
        filled: true,
        fillColor: const Color(0xFFF9F9F9),
        
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility, 
                  color: Colors.grey.shade600,
                ),
              )
            : null,
            
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24), 
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: defaultBorderColor, width: 2),
        ),
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Color(0xFF29B6F6), width: 2.5), 
        ),
      ),
    );
  }
}

