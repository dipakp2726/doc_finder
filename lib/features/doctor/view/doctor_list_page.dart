import 'package:docfinder/core/configs/configs.dart';
import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/view/booking_page.dart';
import 'package:docfinder/features/doctor/widget/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: _DoctorList(),
        ),
      ),
    );
  }
}

class _DoctorList extends ConsumerWidget {
  const _DoctorList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctors = ref.watch(doctorListProvider);

    return doctors.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ProviderScope(
          overrides: [
            currentDoctorProvider.overrideWithValue(data[index]),
          ],
          child: const _DoctorListItem(),
        ),
      ),
      error: (error, stackTrace) {
        return const ErrorView();
      },
      loading: AppLoader.new,
    );
  }
}

class _DoctorListItem extends ConsumerWidget {
  const _DoctorListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedScrollViewItem(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            final doctor = ref.read(currentDoctorProvider);

            Navigator.push(context, BookingPage.route(doctor));
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.fromBorderSide(
                BorderSide(
                  color: AppColors.grey.withOpacity(.2),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: DoctorTile(),
            ),
          ),
        ),
      ),
    );
  }
}
