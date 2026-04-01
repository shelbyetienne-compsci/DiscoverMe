import 'basic_info.dart';
import 'education.dart';
import 'experience.dart';
import 'project.dart';
import 'skill.dart';
import 'link.dart';

class Portfolio {
  final BasicInfo? basicInfo;
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
}