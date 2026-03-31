import 'package:discover_me/models/basic_info.dart';
import 'package:discover_me/models/project.dart';
import 'package:discover_me/repository/portfolio_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/onboarding_controller.dart';

class BasicInfoWidget extends ConsumerStatefulWidget {
  final BasicInfo? basicInfo;

  const BasicInfoWidget({super.key, required this.basicInfo});

  @override
  ConsumerState<BasicInfoWidget> createState() => _BasicInfoWidgetState();
}

class _BasicInfoWidgetState extends ConsumerState<BasicInfoWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final headlineController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final info = widget.basicInfo;

    if (info != null) {
      firstNameController.text = info.firstName;
      lastNameController.text = info.lastName;
      headlineController.text = info.headline;
      bioController.text = info.bio;
      emailController.text = info.email;
      phoneController.text = info.phone ?? '';
      cityController.text = info.city ?? '';
      countryController.text = info.country ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: bioController,
                  decoration: const InputDecoration(
                    labelText: 'Portfolio Bio',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter a bio for your portfolio';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: headlineController,
                  decoration: const InputDecoration(
                    labelText: 'Headline',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter a headline for your portfolio';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  readOnly: true,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length < 7) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    final user = FirebaseAuth.instance.currentUser!;

                    final info = BasicInfo(
                      uid: user.uid,
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      email: user.email ?? '',
                      phone: phoneController.text.trim(),
                      city: cityController.text.trim(),
                      country: countryController.text.trim(),
                      headline: headlineController.text.trim(),
                      bio: bioController.text.trim(),
                    );

                    await ref
                        .read(onboardingControllerProvider.notifier)
                        .submit(info);

                  },
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
