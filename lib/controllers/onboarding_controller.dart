import 'dart:async';

import 'package:discover_me/repository/onboarding_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/basic_info.dart';

class OnboardingController extends AsyncNotifier<BasicInfo?> {
  late final OnboardingRepository _onboardingRepository;

  @override
  FutureOr<BasicInfo?> build() {
    _onboardingRepository = ref.read(onBoardingRepositoryProvider);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    return _onboardingRepository.getBasicInfo(user.uid);
  }

  Future<void> submit(BasicInfo info) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _onboardingRepository.saveBasicInfo(info);
      return info;
    });
  }
}

final onboardingControllerProvider =
    AsyncNotifierProvider<OnboardingController, BasicInfo?>(
      OnboardingController.new,
    );
