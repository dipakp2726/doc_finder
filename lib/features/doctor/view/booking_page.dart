import 'package:docfinder/core/configs/styles/styles.dart';
import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/model/doctor.dart';
import 'package:docfinder/features/doctor/providers/booking_overview.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/view/select_package_page.dart';
import 'package:docfinder/features/doctor/widget/booking_widget.dart';
import 'package:docfinder/features/doctor/widget/doctor_tile.dart';
import 'package:docfinder/features/doctor/widget/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// book appointment page
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  /// The static route for [BookingPage]
  static Route<dynamic> route(Doctor doctor) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ProviderScope(
        overrides: [
          currentDoctorProvider.overrideWithValue(doctor),
        ],
        child: const BookingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book AppointMents'),
        leading: const AppBarLeading(),
      ),
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorTile(),
                  _Divider(),
                  SizedBox(
                    height: AppSpacing.sm,
                  ),
                  AnimateInEffect(child: StatsList()),
                  SizedBox(
                    height: AppSpacing.lg,
                  ),
                  FadeInEffect(child: BookingWidget()),
                ],
              ),
            ),
            Spacer(),
            AnimateInEffect(child: _MakeAppointMentButton()),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      child: Divider(
        thickness: 1,
        color: AppColors.grey.withOpacity(.2),
      ),
    );
  }
}

class _MakeAppointMentButton extends ConsumerWidget {
  const _MakeAppointMentButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        border: Border.all(color: AppColors.grey.withOpacity(.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16).copyWith(bottom: 32),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleLarge,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(24),
              ),
            ),
            onPressed: () {
              final booking = ref.read(bookingOverviewProvider);
              if (booking.bookingDate == null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Please select day')),
                  );
                return;
              }
              if (booking.bookingTime == null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Please select time')),
                  );
                return;
              }
              final doctor = ref.read(currentDoctorProvider);

              Navigator.push(
                context,
                SelectPackagePage.route(doctor),
              );
            },
            child: const Text('Make AppointMent'),
          ),
        ),
      ),
    );
  }
}
