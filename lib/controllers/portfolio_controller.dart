import 'dart:async';

import 'package:discover_me/controllers/onboarding_controller.dart';
import 'package:discover_me/models/experience.dart';
import 'package:discover_me/models/link.dart';
import 'package:discover_me/models/portfolio.dart';
import 'package:discover_me/models/project.dart';
import 'package:discover_me/providers.dart';
import 'package:discover_me/repository/portfolio_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/education.dart';
import '../models/skill.dart';

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

  Future<void> saveProjects(List<Project> projects) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(projects: projects));
  }

  Future<void> saveProject(Project project) async {
    final current = state.value;
    if (current == null) return;

    final exists = current.projects.any((p) => p.id == project.id);

    final updatedProjects = exists
        ? [
            for (final p in current.projects)
              if (p.id == project.id) project else p,
          ]
        : [...current.projects, project];

    state = AsyncData(current.copyWith(projects: updatedProjects));
  }

  Future<void> saveExperience(List<Experience> experiences) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(experiences: experiences));
  }

  Future<void> saveEducation(List<Education> educations) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(education: educations));
  }

  Future<void> saveSkills(List<Skill> skills) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(skills: skills));
  }

  Future<void> saveLinks(List<Link> links) async {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(current.copyWith(links: links));
  }

  Future<void> savePortfolio() async {
    final portfolio = state.value;
    if (portfolio == null) return;
    final rep = ref.read(portfolioRepositoryProvider);

    for (final project in portfolio.projects) {
      await rep.saveProject(project);
    }
    for (final education in portfolio.education) {
      await rep.saveEducation(education);
    }
    for (final experience in portfolio.experiences) {
      await rep.saveExperience(experience);
    }
    for (final skill in portfolio.skills) {
      await rep.saveSkill(skill);
    }
    for (final link in portfolio.links) {
      await rep.saveLink(link);
    }
  }
}

final portfolioControllerProvider =
    AsyncNotifierProvider<PortfolioController, Portfolio>(
      PortfolioController.new,
    );
