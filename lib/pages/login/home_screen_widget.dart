import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        if (user == null) {
          return const Text('Not signed in');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${user.displayName ?? ""}!'),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  context.goNamed(
                    'basic-info',
                  );
                }, child: Text("Work")),
                SizedBox(width: 24),
                ElevatedButton(onPressed: () {
                  context.goNamed(
                    'basic-info',
                  );
                }, child: Text("Creative")),
              ],
            ),
          ],
        );
      },
    );
  }
}
