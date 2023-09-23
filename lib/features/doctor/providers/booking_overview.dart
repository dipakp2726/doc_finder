import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_overview.g.dart';

///
/// booking date and time proivder
/// hold currently selected date and time
///
@riverpod
class BookingOverview extends _$BookingOverview {
  @override
  ({String? bookingDate, String? bookingTime}) build() {
    return (bookingDate: null, bookingTime: null);
  }

  void selectDate(String date) {
    if (state.bookingDate == date) return;

    state = (
      bookingDate: date,
      bookingTime: state.bookingTime,
    );
  }

  void selectTime(String time) {
    if (state.bookingTime == time) return;
    state = (
      bookingTime: time,
      bookingDate: state.bookingDate,
    );
  }
}

///
/// hold currently selected package and duration
///
@riverpod
class PackageOverview extends _$PackageOverview {
  @override
  ({String? duration, String? package}) build() {
    return (duration: null, package: null);
  }

  void selectDuration(String duration) {
    if (state.duration == duration) return;

    state = (
      duration: duration,
      package: state.package,
    );
  }

  void selectPackage(String package) {
    if (state.package == package) return;

    state = (
      duration: state.duration,
      package: package,
    );
  }
}
