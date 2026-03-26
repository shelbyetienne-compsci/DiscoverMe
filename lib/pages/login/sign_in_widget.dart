import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com',
      );

      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          try {
            await signInWithGoogle();
          } on FirebaseAuthException catch (e) {
            print('FirebaseAuthException');
            print('code: ${e.code}');
            print('message: ${e.message}');
          } catch (e) {
            print('ERROR: $e');
          }
        },
        child: Text("Sign In with Google"),
      ),
    );
  }
}
