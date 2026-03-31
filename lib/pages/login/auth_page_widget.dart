import 'package:discover_me/controllers/onboarding_controller.dart';
import 'package:discover_me/pages/login/sign_in_widget.dart';
import 'package:discover_me/pages/onboarding/basic_info_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPageWidget extends ConsumerWidget {
  const AuthPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
      
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
      
          if (!snapshot.hasData) {
            return const SignInWidget();
          }
          //HOME/WELCOME PAGE HERE LATER
          final basicInfo = ref.watch(onboardingControllerProvider).value;

          return BasicInfoWidget(basicInfo: basicInfo?.copyWith(email:  snapshot.data?.email));
        },
      ),
    );
  }
}
