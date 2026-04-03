import 'package:discover_me/controllers/portfolio_controller.dart';
import 'package:discover_me/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectSectionWidget extends StatelessWidget {
  final List<Project> projects;

  const ProjectSectionWidget({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Projects'),
        for (final project in projects) ProjectFormWidget(project: project),
        ProjectFormWidget(),
      ],
    );
  }
}

class ProjectFormWidget extends ConsumerStatefulWidget {
  final Project? project;

  const ProjectFormWidget({super.key, this.project});

  @override
  ConsumerState<ProjectFormWidget> createState() => _ProjectFormWidgetState();
}

class _ProjectFormWidgetState extends ConsumerState<ProjectFormWidget> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController skillsController;
  late final TextEditingController urlController;
  late final TextEditingController startDateController;
  late final TextEditingController endDateController;

  @override
  void initState() {
    super.initState();

    final project = widget.project;
    if (project != null) {
      titleController.text = project.title;
      descriptionController.text = project.description;
      urlController.text = project.liveUrl ?? '';
      startDateController.text = project.startDate.toString();
      endDateController.text = project.endDate.toString();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Project Title',
            border: OutlineInputBorder(),
          ),
          onEditingComplete: () {},
        ),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: 'Write project description',
            border: OutlineInputBorder(),
          ),
        ),
        TextFormField(
          controller: skillsController,
          decoration: const InputDecoration(
            labelText: 'skills, skills, skills',
            border: OutlineInputBorder(),
          ),
        ),
        TextFormField(
          controller: urlController,
          decoration: const InputDecoration(
            labelText: 'Link to project',
            border: OutlineInputBorder(),
          ),
        ),
        TextFormField(
          controller: startDateController,
          decoration: const InputDecoration(
            labelText: 'Start Date',
            border: OutlineInputBorder(),
          ),
        ),
        TextFormField(
          controller: endDateController,
          decoration: const InputDecoration(
            labelText: 'End Date',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
