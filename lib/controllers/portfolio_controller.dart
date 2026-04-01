import 'dart:async';

import 'package:discover_me/controllers/onboarding_controller.dart';
import 'package:discover_me/models/portfolio.dart';
import 'package:discover_me/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioController extends AsyncNotifier<Portfolio> {
  @override
  Future<Portfolio> build() async {
    final onboardingState = ref.watch(onboardingControllerProvider);
    final projectsState = ref.watch(projectsProvider);
    final experienceState = ref.watch(experiencesProvider);
    final educationState = ref.watch(educationProvider);
    final skillsState = ref.watch(skillsProvider);
    final linksState = ref.watch(linksProvider);

    final basicInfo = onboardingState.value;

    return Portfolio(
      basicInfo: basicInfo,
      projects: projectsState.value ?? const [],
      experiences: experienceState.value ?? const [],
      education: educationState.value ?? const [],
      skills: skillsState.value ?? const [],
      links: linksState.value ?? const [],
    );
  }


}

final portfolioControllerProvider =
    AsyncNotifierProvider<PortfolioController, Portfolio>(
      PortfolioController.new,
    );
