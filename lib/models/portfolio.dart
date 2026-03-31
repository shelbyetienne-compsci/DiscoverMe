import 'basic_info.dart';
import 'education.dart';
import 'experience.dart';
import 'project.dart';
import 'skill.dart';
import 'link.dart';

class Portfolio {
  final BasicInfo basicInfo;
  final List<Project> projects;
  final List<Experience> experiences;
  final List<Education> education;
  final List<Skill> skills;
  final List<Link> links;

  const Portfolio({
    required this.basicInfo,
    required this.projects,
    required this.experiences,
    required this.education,
    required this.skills,
    required this.links,
  });

  Portfolio copyWith({
    BasicInfo? basicInfo,
    List<Project>? projects,
    List<Experience>? experiences,
    List<Education>? education,
    List<Skill>? skills,
    List<Link>? links,
  }) {
    return Portfolio(
      basicInfo: basicInfo ?? this.basicInfo,
      projects: projects ?? this.projects,
      experiences: experiences ?? this.experiences,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'basicInfo': basicInfo.toJson(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'experiences': experiences.map((e) => e.toJson()).toList(),
      'education': education.map((e) => e.toJson()).toList(),
      'skills': skills.map((e) => e.toJson()).toList(),
      'links': links.map((e) => e.toJson()).toList(),
    };
  }

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      basicInfo: BasicInfo.fromJson(
        json['basicInfo'] as Map<String, dynamic>? ?? {},
      ),
      projects: (json['projects'] as List<dynamic>? ?? [])
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      experiences: (json['experiences'] as List<dynamic>? ?? [])
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>? ?? [])
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>? ?? [])
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>? ?? [])
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}