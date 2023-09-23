import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/model/model.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/widget/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

///
/// my active bookings
///
class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  /// The static route for [MyBookingsPage]
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MyBookingsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: _BookingList(),
        ),
      ),
    );
  }
}

class _BookingList extends ConsumerWidget {
  const _BookingList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsAsyc = ref.watch(getBookingsProvider);

    return AsyncValueWidget(
      value: bookingsAsyc,
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => AnimatedScrollViewItem(
            child: _BookingListItem(
              booking: data[index],
            ),
          ),
        );
      },
    );
  }
}

class _BookingListItem extends ConsumerWidget {
  const _BookingListItem({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime =
        '${_getFormatedDate(booking.appointmentDate)} | ${booking.appointmentTime.split('-').first}';

    final doctor = ref.watch(
      doctorByNameProvider(doctorName: booking.doctorName),
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  dateTime,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              _BookingInfoWidget(doctor: doctor, booking: booking),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          backgroundColor: Colors.blue.shade100,
                        ),
                        onPressed: () {},
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        onPressed: () {},
                        child: const Text('Reschedule'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookingInfoWidget extends StatelessWidget {
  const _BookingInfoWidget({
    required this.doctor,
    required this.booking,
  });

  final Doctor doctor;
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppCachedNetworkImage(
                imageUrl: doctor.image,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              width: AppSpacing.sm,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.doctorName,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Flexible(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: AppColors.primary,
                          size: 18,
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
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.book_online,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      Text(
                        'Booking ID :',
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.grey),
                      ),
                      Text(
                        '#${booking.bookingId}',
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getFormatedDate(String date) {
  final val = DateTime.parse(date);

  return DateFormat('MMMd, y').format(val);
}
