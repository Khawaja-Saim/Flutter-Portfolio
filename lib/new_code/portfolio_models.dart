import 'dart:ui';

class SkillModel {
  final String name;
  final String icon;
  final double level; // 0.0 to 1.0
  const SkillModel({
    required this.name,
    required this.icon,
    required this.level,
  });
}

class ExperienceModel {
  final String company;
  final String role;
  final String period;
  final String description;
  final List<String> achievements;
  const ExperienceModel({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.achievements,
  });
}

class ProjectModel {
  final String title;
  final String description;
  final String emoji;
  final List<String> tags;
  final String? storeLabel;
  final String? storeUrl;
  final Color thumbColor;
  const ProjectModel({
    required this.title,
    required this.description,
    required this.emoji,
    required this.tags,
    this.storeLabel,
    this.storeUrl,
    required this.thumbColor,
  });
}

class ServiceModel {
  final String title;
  final String description;
  final String icon;
  const ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}
