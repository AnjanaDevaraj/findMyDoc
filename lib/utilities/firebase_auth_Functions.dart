import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  final FirebaseAuth auth = FirebaseAuth.instance;

  ///register user
  Future<String?> registerUser(
      {required String email, required String pwd}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }

  ///login user
  Future<String?> loginUser(
      {required String email, required String pwd}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }

  ///SignOut
  Future <void> logoutUser() async{
    await FirebaseAuth.instance.signOut();
  }
}
