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
    this.defaultBorderColor = const Color(0xFFE0E0E0), // اللون الرمادي الفاتح الافتراضي
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
        
        // تعديل أيقونة العين لتتغير بناءً على حالة الباسورد
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility, // هنا التعديل للعين
                  color: Colors.grey.shade600,
                ),
              )
            : null,
            
        // زيادة الـ vertical padding عشان الحقل يكون أعرض (أطول)
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24), 
        
        // شكل الحدود في الحالة العادية (قبل الضغط)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: defaultBorderColor, width: 2),
        ),
        
        // شكل الحدود عند التحديد (Focus) - خليناه دايماً لبني لأي حقل
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Color(0xFF29B6F6), width: 2.5), 
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final TextEditingController controller;
//   final bool isPassword;
//   final bool obscureText;
//   final VoidCallback? onSuffixTap;
//   final Color borderColor;

//   const CustomTextField({
//     Key? key,
//     required this.hint,
//     required this.controller,
//     this.isPassword = false,
//     this.obscureText = false,
//     this.onSuffixTap,
//     this.borderColor = const Color(0xFFE0E0E0), // رمادي افتراضي
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 18),
//         filled: true,
//         fillColor: const Color(0xFFF9F9F9),
//         // أيقونة العين تظهر فقط إذا كان الحقل للباسورد
//         suffixIcon: isPassword
//             ? GestureDetector(
//                 onTap: onSuffixTap,
//                 child: Icon(Icons.visibility, color: Colors.grey.shade600),
//               )
//             : null,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//         // حواف دائرية تماماً مثل الصورة
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(40),
//           borderSide: BorderSide(color: borderColor, width: 2),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(40),
//           borderSide: BorderSide(color: borderColor, width: 2.5),
//         ),
//       ),
//     );
//   }
// }