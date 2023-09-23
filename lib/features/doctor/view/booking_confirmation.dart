import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/model/model.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/view/my_bookings_page.dart';
import 'package:docfinder/features/doctor/widget/async_value_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Confirmation page for booking
///
class BookingConfirmationPage extends StatelessWidget {
  const BookingConfirmationPage({super.key});

  /// The static route for [BookingConfirmationPage]
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const BookingConfirmationPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        leading: const AppBarLeading(),
      ),
      body: const SafeArea(
        bottom: false,
        child: _BookingDetails(),
      ),
    );
  }
}

class _BookingDetails extends ConsumerWidget {
  const _BookingDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingAsync = ref.watch(bookingConfirmationProvider);

    return AsyncValueWidget(
      value: bookingAsync,
      data: (booking) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            const AnimateInEffect(child: _CheckIconWidget()),
            const SizedBox(height: AppSpacing.xlg),
            Text(
              'Appointment Confirmed!'.hardCoded,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppSpacing.xlg),
            Text(
              'You have succesfully booked appointment with',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.grey),
            ),
            Text(
              booking.doctorName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.xlg),
            FadeInEffect(child: _DetailsWidget(booking)),
            const Spacer(),
            const AnimateInEffect(
              child: _Buttons(),
            ),
          ],
        );
      },
    );
  }
}

class _CheckIconWidget extends StatelessWidget {
  const _CheckIconWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: AppColors.white,
        size: 72,
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        border: Border.all(color: AppColors.grey.withOpacity(.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16).copyWith(bottom: 32),
        child: Column(
          children: [
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MyBookingsPage.route(),
                    (route) => route.isFirst,
                  );
                  Navigator.pushReplacement(context, MyBookingsPage.route());
                },
                child: Text('View Appointments'.hardCoded),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Book Another'.hardCoded),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsWidget extends StatelessWidget {
  const _DetailsWidget(this.booking);

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          _RowWidget(
            icon: Icons.person,
            value: 'Esther Howard',
          ),
          Row(
            children: [
              Expanded(
                child: _RowWidget(
                  icon: Icons.calendar_month,
                  value: 'Esther Howard',
                ),
              ),
              Expanded(
                child: _RowWidget(
                  icon: CupertinoIcons.clock_fill,
                  value: 'Esther Howard',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RowWidget extends StatelessWidget {
  const _RowWidget({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),
          const SizedBox(
            width: AppSpacing.xs,
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
