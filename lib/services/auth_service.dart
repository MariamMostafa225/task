import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // إنشاء نسخة من Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // وظيفة التسجيل (Register)
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Error in Registration: ${e.toString()}");
      return null;
    }
  }

  // وظيفة تسجيل الدخول (Login)
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Error in Login: ${e.toString()}");
      return null;
    }
  }

  // وظيفة تسجيل الخروج
  Future<void> logout() async {
    await _auth.signOut();
  }
}
