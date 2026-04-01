import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover_me/models/education.dart';
import 'package:discover_me/models/experience.dart';
import 'package:discover_me/models/link.dart';
import 'package:discover_me/models/project.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/skill.dart';
import '../providers.dart';

class PortfolioRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  PortfolioRepository(this.firestore, this.auth);

  //PROJECTS
  Future<void> saveProject(Project project) async {
    await _projectsRef.doc(project.id).set(project.toJson());
  }

  Future<void> deleteProject(Project project) async {
    await _projectsRef.doc(project.id).delete();
  }

  Stream<List<Project>> watchProjects() {
    return _projectsRef.orderBy('order').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Project.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  //EXPERIENCE
  Future<void> saveExperience(Experience experience) async {
    await _experienceRef.doc(experience.id).set(experience.toJson());
  }

  Future<void> deleteExperience(Experience experience) async {
    await _experienceRef.doc(experience.id).delete();
  }

  Stream<List<Experience>> watchExperiences() {
    return _experienceRef.orderBy('order').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Experience.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  //EDUCATION
  Future<void> saveEducation(Education education) async {
    await _educationRef.doc(education.id).set(education.toJson());
  }

  Future<void> deleteEducation(Education education) async {
    await _educationRef.doc(education.id).delete();
  }

  Stream<List<Education>> watchEducation() {
    return _educationRef.orderBy('order').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Education.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  //SKILLS
  Future<void> saveSkill(Skill skill) async {
    await _skillsRef.doc(skill.id).set(skill.toJson());
  }

  Future<void> deleteSkill(Skill skill) async {
    await _skillsRef.doc(skill.id).delete();
  }

  Stream<List<Skill>> watchSkills() {
    return _skillsRef.orderBy('order').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Skill.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  //LINKS
  Future<void> saveLink(Link link) async {
    await _linksRef.doc(link.id).set(link.toJson());
  }

  Future<void> deleteLink(Link link) async {
    await _linksRef.doc(link.id).delete();
  }

  Stream<List<Link>> watchLinks() {
    return _linksRef.orderBy('order').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Link.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  CollectionReference<Map<String, dynamic>> get _projectsRef => firestore
      .collection('users')
      .doc(auth.currentUser?.uid)
      .collection('projects');

  CollectionReference<Map<String, dynamic>> get _experienceRef => firestore
      .collection('users')
      .doc(auth.currentUser?.uid)
      .collection('experiences');

  CollectionReference<Map<String, dynamic>> get _educationRef => firestore
      .collection('users')
      .doc(auth.currentUser?.uid)
      .collection('education');

  CollectionReference<Map<String, dynamic>> get _skillsRef => firestore
      .collection('users')
      .doc(auth.currentUser?.uid)
      .collection('skills');

  CollectionReference<Map<String, dynamic>> get _linksRef => firestore
      .collection('users')
      .doc(auth.currentUser?.uid)
      .collection('links');
}

final portfolioRepositoryProvider = Provider<PortfolioRepository>((ref) {
  final firestore = ref.watch(fireStoreProvider);
  return PortfolioRepository(firestore, FirebaseAuth.instance);
});
