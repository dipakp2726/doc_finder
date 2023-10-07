// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_overview.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookingOverviewHash() => r'c6ff9dda7f4acb929bc43cbeab534682efae88a6';

///
/// booking date and time proivder
/// hold currently selected date and time
///
///
/// Copied from [BookingOverview].
@ProviderFor(BookingOverview)
final bookingOverviewProvider = AutoDisposeNotifierProvider<BookingOverview,
    ({String? bookingDate, String? bookingTime})>.internal(
  BookingOverview.new,
  name: r'bookingOverviewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookingOverviewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookingOverview
    = AutoDisposeNotifier<({String? bookingDate, String? bookingTime})>;
String _$packageOverviewHash() => r'e910c3bd8165e538db26d339c2b722d54b11cde3';

///
/// hold currently selected package and duration
///
///
/// Copied from [PackageOverview].
@ProviderFor(PackageOverview)
final packageOverviewProvider = AutoDisposeNotifierProvider<PackageOverview,
    ({String? duration, String? package})>.internal(
  PackageOverview.new,
  name: r'packageOverviewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$packageOverviewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PackageOverview
    = AutoDisposeNotifier<({String? duration, String? package})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
