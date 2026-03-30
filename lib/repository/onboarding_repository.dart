import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/basic_info.dart';

class OnboardingRepository {
  final FirebaseFirestore firestore;

  OnboardingRepository(this.firestore);

  Future<BasicInfo?> getBasicInfo(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return BasicInfo.fromJson(doc.data()!);
  }

  Future<void> saveBasicInfo(BasicInfo info) async {
    await firestore
        .collection('users')
        .doc(info.uid)
        .set(info.toJson(), SetOptions(merge: true));
  }
}

final fireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final onBoardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final firestore = ref.watch(fireStoreProvider);
  return OnboardingRepository(firestore);
});
