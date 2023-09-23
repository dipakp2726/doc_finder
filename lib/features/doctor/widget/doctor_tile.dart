import 'package:docfinder/core/configs/styles/styles.dart';
import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorTile extends ConsumerWidget {
  const DoctorTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctor = ref.watch(currentDoctorProvider);

    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Hero(
            tag: 'doctor_${doctor.doctorName}_tag',
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: AppCachedNetworkImage(
                    imageUrl: doctor.image,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.doctorName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    doctor.speciality,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: AppColors.primary,
                        ),
                        Flexible(
                          child: Text(
                            doctor.location,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColors.grey),
                          ),
                        ),
                        //TODO: update correct icon
                        const Icon(
                          Icons.location_pin,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
