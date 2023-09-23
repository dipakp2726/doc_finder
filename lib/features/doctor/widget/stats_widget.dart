import 'package:docfinder/core/configs/styles/styles.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// doctor stats widget
///
class StatsList extends ConsumerWidget {
  const StatsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctor = ref.read(currentDoctorProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StateItem(
            value: doctor.patientsServed.toString(),
            title: 'Patients'.hardCoded,
            icon: Icons.people,
          ),
          _StateItem(
            value: doctor.yearsOfExperience.toString(),
            title: 'Years Exp.'.hardCoded,
            icon: Icons.badge,
          ),
          _StateItem(
            value: doctor.patientsServed.toString(),
            title: 'Rating'.hardCoded,
            icon: Icons.star_rate,
          ),
          _StateItem(
            value: doctor.patientsServed.toString(),
            title: 'Review'.hardCoded,
            icon: Icons.message,
          ),
        ],
      ),
    );
  }
}

class _StateItem extends StatelessWidget {
  const _StateItem({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.primary.withOpacity(.2),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 32,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          '$value' '+',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.primary),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
