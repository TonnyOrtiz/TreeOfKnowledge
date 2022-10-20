import 'package:brew_app/models/brewuser.dart';
import 'package:brew_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on Firebase User
  BrewUser? _userFromFirebaseUser(User? user){
    return user!=null ?  BrewUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<BrewUser?> get user {
    return _auth.authStateChanges()
    .map(_userFromFirebaseUser);
  } 

  // Sign in Anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      FirebaseAuthException error = e as FirebaseAuthException;     
      return error.code;
      //return null;
    }
  }

  // Register witrh email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null){
        await DatabaseService(uid: user.uid).updateUserData('0', 'Nuevo Miembro', 100);
      }
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}