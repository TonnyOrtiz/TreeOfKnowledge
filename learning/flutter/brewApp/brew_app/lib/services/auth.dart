import 'package:brew_app/models/brewuser.dart';
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
      User user = result.user as User;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register witrh email and password

  // sign out
}