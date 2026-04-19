import 'package:flutter/material.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/screens/register_screen.dart';
import 'package:task/services/auth_service.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  bool isObscure = true;

  bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 60),

              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.black,
                child: Icon(Icons.person, size: 100, color: Colors.white),
              ),

              const SizedBox(height: 50),

              CustomTextField(
                hint: "Email",
                controller: emailController,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                hint: "Password",
                controller: passwordController,
                isPassword: true,
                obscureText: isObscure,
                onSuffixTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: 160,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (!isValidEmail(email)) {
                      showMessage("Enter a valid email");
                      return;
                    }

                    if (password.length < 6) {
                      showMessage("Password must be at least 6 characters");
                      return;
                    }

                    var user = await auth.login(email, password);

                    if (user != null) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
} else {
  showMessage("Login Failed");
}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4FC3F7),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: Color(0xFF616161), fontSize: 16),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: const Text(
                  "Not a member? Sign up now",
                  style: TextStyle(color: Color(0xFF616161), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:task/screens/register_screen.dart';
// import '../widgets/custom_text_field.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FB), // لون الخلفية الفاتح
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             children: [
//               const SizedBox(height: 60),

//               // أيقونة البروفايل العلوية
//               const CircleAvatar(
//                 radius: 70,
//                 backgroundColor: Colors.black,
//                 child: Icon(Icons.person, size: 100, color: Colors.white),
//               ),

//               const SizedBox(height: 50),

//               // حقل الإيميل بحدود زرقاء
//               CustomTextField(
//                 hint: "Email",
//                 controller: emailController, // اللون الأزرق السماوي
//               ),

//               const SizedBox(height: 20),

//               // حقل الباسورد بحدود رمادية
//               CustomTextField(
//                 hint: "Password",
//                 controller: passwordController,
//                 isPassword: true,
//                 obscureText: isObscure,

//                 onSuffixTap: () {
//                   setState(() {
//                     isObscure = !isObscure;
//                   });
//                 },
//               ),

//               const SizedBox(height: 40),

//               // زر تسجيل الدخول
//               SizedBox(
//                 width: 160, // عرض الزر كما في الصورة
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Logic هنا
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4FC3F7),
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     "Log In",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // نصوص أسفل الزر
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Forgot password?",
//                   style: TextStyle(color: Color(0xFF616161), fontSize: 16),
//                 ),
//               ),

//               const SizedBox(height: 10),

//               TextButton(
//                 onPressed: () {
//                   // كود الانتقال لشاشة التسجيل
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => RegisterScreen()),
//                   );
//                 },
//                 child: const Text(
//                   "Not a member? Sign up now",
//                   style: TextStyle(color: Color(0xFF616161), fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
