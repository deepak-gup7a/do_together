import 'package:do_together/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // AuthService(this._firebaseAuth);

  Stream<User>get authChange => _firebaseAuth.authStateChanges();

  Future signOut()async{
    try{
      return await _firebaseAuth.signOut();
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  Future signIn({String email,String pass})async{
    try{
      UserCredential userCred =  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      User user = userCred.user;
      print(user);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  Future signUp({String email,String pass,String name})async{
    try{
      UserCredential userCred =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      User user = userCred.user;
      await user.updateProfile(displayName: name);
      if(user.emailVerified==false){
        await user.sendEmailVerification();
      }
      print(user);
      return user;
    }on FirebaseAuthException catch(e){
      print(e.toString());
      return null;
    }
  }

  Future sendEmailForVerification()async{
    try{
      User user =  _firebaseAuth.currentUser;
      await user.sendEmailVerification();
    }catch(e){

    }
  }

  user getUserDetails(){
    User firebaseUser = _firebaseAuth.currentUser;
    print(firebaseUser.emailVerified);
    if(firebaseUser == null)
      return null;
    return user(uid:firebaseUser.uid,name: firebaseUser.displayName,emailId: firebaseUser.email);
  }

}