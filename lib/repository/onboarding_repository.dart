import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover_me/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/basic_info.dart';

class OnboardingRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  OnboardingRepository(this.firestore, this.auth);

  Future<BasicInfo?> getBasicInfo() async {
    final doc = await firestore.collection('users').doc(auth.currentUser?.uid).get();
    if (!doc.exists) return null;
    return BasicInfo.fromJson(doc.data()!);
  }

  Future<void> saveBasicInfo(BasicInfo info) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .set(info.toJson(), SetOptions(merge: true));
  }
}

final onBoardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final firestore = ref.watch(fireStoreProvider);
  return OnboardingRepository(firestore, FirebaseAuth.instance);
});
