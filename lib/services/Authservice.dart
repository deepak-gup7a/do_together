
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User>get authChange => _firebaseAuth.authStateChanges();

  Future<String>signOut()async{
    try{
      await _firebaseAuth.signOut();
      return "sign out";
    }on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  Future<String>signIn({String email,String pass})async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      return "sign in";
    }catch(e){
      return e.toString();
    }

  }

  Future<String>signUp({String email,String pass})async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      return "Sign up";
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }


}