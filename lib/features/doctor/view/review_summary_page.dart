import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/model/model.dart';
import 'package:docfinder/features/doctor/providers/booking_overview.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/view/booking_confirmation.dart';
import 'package:docfinder/features/doctor/widget/doctor_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

///
/// Booking review summary page
///
class ReviewSummaryPage extends StatelessWidget {
  const ReviewSummaryPage({super.key});

  /// The static route for [ReviewSummaryPage]
  static Route<dynamic> route(Doctor doctor) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ProviderScope(
        overrides: [
          currentDoctorProvider.overrideWithValue(doctor),
        ],
        child: const ReviewSummaryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Summary'.hardCoded),
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
                  FadeInEffect(child: DoctorTile()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: _Divider(),
                  ),
                  AnimateInEffect(child: _SummaryWidget()),
                ],
              ),
            ),
            Spacer(),
            AnimateInEffect(child: _NextButton()),
          ],
        ),
      ),
    );
  }
}

class _SummaryWidget extends ConsumerWidget {
  const _SummaryWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingOverview = ref.watch(bookingOverviewProvider);
    final packageOverview = ref.watch(packageOverviewProvider);

    final dateTime =
        '${_getFormatedDate(bookingOverview.bookingDate!)} | ${bookingOverview.bookingTime!.split('-').first}';
    return Column(
      children: [
        _SummaryRow(
          title: 'Date & Hour',
          value: dateTime,
        ),
        _SummaryRow(
          title: 'Pacakge',
          value: packageOverview.package!,
        ),
        _SummaryRow(
          title: 'Duration',
          value: packageOverview.duration!,
        ),
        const _SummaryRow(
          title: 'Booking for',
          value: 'Self',
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.grey),
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

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
        child: SizedBox(
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
                BookingConfirmationPage.route(),
                (route) => route.isFirst,
              );
            },
            child: Text('Confirm'.hardCoded),
          ),
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

String _getFormatedDate(String date) {
  final val = DateTime.parse(date);

  return DateFormat('MMMd, y').format(val);
}
