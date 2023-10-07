import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/view/booking_page.dart';
import 'package:docfinder/features/doctor/widget/async_value_widget.dart';
import 'package:docfinder/features/doctor/widget/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// doctor list page
///
class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Doctors'),
      ),
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
    final doctors = ref.watch(filteredDoctorsProvider);

    return Column(
      children: [
        FilterWidget(),
        doctors.when(
          data: (data) => Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return ref.refresh(doctorListProvider.future);
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ProviderScope(
                  overrides: [
                    currentDoctorProvider.overrideWithValue(data[index]),
                  ],
                  child: const _DoctorListItem(),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) {
            return const ErrorView();
          },
          loading: AppLoader.new,
        ),
      ],
    );
  }
}

class FilterWidget extends ConsumerWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(getSpecialitiesProvider);

    final currentFilter = ref.watch(currentSpecialityProvider);

    return AsyncValueWidget(
      value: filters,
      data: (data) {
        return DropdownButton<String>(
          value: currentFilter,
          items: ['All', ...data]
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e == 'All' ? null : e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (data) {
            ref.read(currentSpecialityProvider.notifier).state =
                data == 'All' ? null : data;
          },
        );
      },
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
