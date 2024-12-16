import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

//Email sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      //sign user in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Email sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      //sign user in
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  //google sign in
  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally for sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
