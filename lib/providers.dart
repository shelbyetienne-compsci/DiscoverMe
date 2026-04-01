import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover_me/repository/portfolio_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/education.dart';
import 'models/experience.dart';
import 'models/link.dart';
import 'models/project.dart';
import 'models/skill.dart';

final fireStoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final projectsProvider = StreamProvider<List<Project>>((ref) {
  final repo = ref.read(portfolioRepositoryProvider);
  return repo.watchProjects();
});

final experiencesProvider = StreamProvider<List<Experience>>((ref) {
  final repo = ref.read(portfolioRepositoryProvider);
  return repo.watchExperiences();
});

final educationProvider = StreamProvider<List<Education>>((ref) {
  final repo = ref.read(portfolioRepositoryProvider);
  return repo.watchEducation();
});

final skillsProvider = StreamProvider<List<Skill>>((ref) {
  final repo = ref.read(portfolioRepositoryProvider);
  return repo.watchSkills();
});

final linksProvider = StreamProvider<List<Link>>((ref) {
  final repo = ref.read(portfolioRepositoryProvider);
  return repo.watchLinks();
});