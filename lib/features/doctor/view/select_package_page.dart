import 'package:docfinder/core/configs/styles/styles.dart';
import 'package:docfinder/core/widgets/widgets.dart';
import 'package:docfinder/features/doctor/model/model.dart';
import 'package:docfinder/features/doctor/providers/booking_overview.dart';
import 'package:docfinder/features/doctor/providers/doctor_providers.dart';
import 'package:docfinder/features/doctor/view/review_summary_page.dart';
import 'package:docfinder/features/doctor/widget/async_value_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Page for select package
///
class SelectPackagePage extends StatelessWidget {
  const SelectPackagePage({super.key});

  /// The static route for [SelectPackagePage]
  static Route<dynamic> route(Doctor doctor) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ProviderScope(
        overrides: [
          currentDoctorProvider.overrideWithValue(doctor),
        ],
        child: const SelectPackagePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select package'.hardCoded),
        leading: const AppBarLeading(),
      ),
      body: const SafeArea(
        bottom: false,
        child: _BookingBody(),
      ),
    );
  }
}

class _BookingBody extends ConsumerWidget {
  const _BookingBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageAsync = ref.watch(getPackagesProvider);

    return AsyncValueWidget(
      value: packageAsync,
      data: (data) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Duration',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  _DurationDropDown(
                    durations: data.duration,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Select Package',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  FadeInEffect(
                    child: _PackageList(
                      packages: data.package,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const AnimateInEffect(child: _NextButton()),
          ],
        );
      },
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

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
              final package = ref.read(packageOverviewProvider);
              if (package.duration == null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Please select duration')),
                  );
                return;
              }
              if (package.package == null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Please select package')),
                  );
                return;
              }
              final doctor = ref.read(currentDoctorProvider);

              Navigator.push(context, ReviewSummaryPage.route(doctor));
            },
            child: Text('Next'.hardCoded),
          ),
        ),
      ),
    );
  }
}

class _PackageList extends StatelessWidget {
  const _PackageList({required this.packages});
  final List<String> packages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final val in packages)
          _PackageItem(
            package: val,
          ),
      ],
    );
  }
}

class _PackageItem extends ConsumerWidget {
  const _PackageItem({required this.package});

  final String package;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPackage =
        ref.watch(packageOverviewProvider.select((value) => value.package));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RadioListTile<String>(
        value: package,
        groupValue: selectedPackage,
        onChanged: (value) => ref
            .read(
              packageOverviewProvider.notifier,
            )
            .selectPackage(value!),
        controlAffinity: ListTileControlAffinity.trailing,
        secondary: CircleAvatar(
          radius: 32,
          foregroundColor: AppColors.primary.withOpacity(.1),
          child: Icon(
            getPackageIcon(package),
            color: AppColors.primary,
            size: 24,
          ),
        ),
        contentPadding: const EdgeInsets.all(4),
        title: Text(
          package,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(getPackageDescription(package)),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.grey.withOpacity(.2)),
        ),
      ),
    );
  }
}

class _DurationDropDown extends ConsumerWidget {
  const _DurationDropDown({required this.durations});

  final List<String> durations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Expanded(
        child: DropdownMenu<String>(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border: _border(),
            enabledBorder: _border(),
            fillColor: AppColors.white,
          ),
          leadingIcon: const Icon(
            CupertinoIcons.clock_fill,
            color: AppColors.primary,
          ),
          trailingIcon: const Icon(
            CupertinoIcons.chevron_down,
            color: AppColors.primary,
          ),
          width: MediaQuery.sizeOf(context).width - 36,
          onSelected: (String? value) {
            ref
                .read(
                  packageOverviewProvider.notifier,
                )
                .selectDuration(value!);
            // This is called when the user selects an item.
          },
          hintText: 'Duration',
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
          dropdownMenuEntries:
              durations.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey.withOpacity(.2)),
    );
  }
}

String getPackageDescription(String package) {
  return switch (package) {
    'Messaging' => 'Chat with doctor',
    'Voice Call' => 'Voice call with doctor',
    'Video Call' => 'Video call with doctor',
    'In Person' => 'In person visit with doctor',
    _ => package,
  };
}

IconData getPackageIcon(String package) {
  return switch (package) {
    'Messaging' => Icons.message,
    'Voice Call' => Icons.call,
    'Video Call' => Icons.videocam,
    'In Person' => Icons.person,
    _ => Icons.message,
  };
}
