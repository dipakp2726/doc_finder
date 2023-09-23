import 'package:docfinder/core/configs/styles/styles.dart';
import 'package:docfinder/features/doctor/providers/booking_overview.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

///
/// appointment booking widget
///
class BookingWidget extends StatelessWidget {
  const BookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BOOK APPOINTMENT',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.grey),
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Day',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const _DayListWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Time',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const _TimeListWidget(),
      ],
    );
  }
}

class _TimeListWidget extends ConsumerWidget {
  const _TimeListWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availability = ref.watch(currentDoctorProvider).availability;

    final bookingOverview = ref.watch(bookingOverviewProvider);

    final date = bookingOverview.bookingDate;

    final slots = availability['$date'] ?? [];

    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: slots.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final currentTime = slots[index];
          return _TimeSelectorBox(
            onSelected: () {
              ref
                  .read(bookingOverviewProvider.notifier)
                  .selectTime(currentTime);
            },
            selected: currentTime == bookingOverview.bookingTime,
            value: currentTime.split('-').first,
          );
        },
      ),
    );
  }
}

class _DayListWidget extends ConsumerWidget {
  const _DayListWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availability = ref.watch(currentDoctorProvider).availability;

    final bookingDate =
        ref.watch(bookingOverviewProvider.select((value) => value.bookingDate));

    return SizedBox(
      height: 78,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: availability.keys.length,
        itemBuilder: (context, index) {
          final currentDate = availability.keys.elementAt(index);
          return _DaySelectorBox(
            date: currentDate,
            selected: bookingDate == currentDate,
            onSelected: () {
              ref
                  .read(bookingOverviewProvider.notifier)
                  .selectDate(currentDate);
            },
          );
        },
      ),
    );
  }
}

class _DaySelectorBox extends StatelessWidget {
  const _DaySelectorBox({
    required this.date,
    required this.onSelected,
    this.selected = false,
  });

  final String date;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final day = getDayName(date);
    final color = selected ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onSelected,
        borderRadius: BorderRadius.circular(56),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 90,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(56),
            border: Border.all(color: AppColors.grey.withOpacity(.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: Theme.of(context)
                    .primaryTextTheme
                    .bodySmall!
                    .copyWith(color: color),
                child: Text(
                  day.weekday,
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleLarge!
                    .copyWith(color: color),
                child: Text(
                  day.day,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeSelectorBox extends StatelessWidget {
  const _TimeSelectorBox({
    required this.value,
    required this.onSelected,
    required this.selected,
  });

  final String value;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onSelected,
        borderRadius: BorderRadius.circular(56),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 90,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(56),
            border: Border.all(color: AppColors.grey.withOpacity(.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleMedium!
                    .copyWith(color: color),
                child: Text(
                  value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

({String weekday, String day}) getDayName(String date) {
  final val = DateTime.parse(date);

  final weekday = DateFormat('E').format(val);
  final day = DateFormat('d MMM').format(val);

  return (weekday: weekday, day: day);
}
