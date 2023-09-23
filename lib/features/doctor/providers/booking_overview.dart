import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_overview.freezed.dart';
part 'booking_overview.g.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    String? bookingDate,
    String? bookingTime,
  }) = _BookingState;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const BookingState._();
}

@riverpod
class BookingOverview extends _$BookingOverview {
  @override
  BookingState build() {
    return const BookingState();
  }

  void selectDate(String date) {
    if (state.bookingDate == date) return;
    state = state.copyWith(
      bookingDate: date,
      bookingTime: null,
    );
  }

  void selectTime(String time) {
    if (state.bookingTime == time) return;
    state = state.copyWith(bookingTime: time);
  }
}

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
