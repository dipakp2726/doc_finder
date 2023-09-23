import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `booking.dart` with the code generated
// by freezed
part 'booking.freezed.dart';
// optional: since our [Booking] class is serialisable,
// we must add this line. but if [Booking] was not serialisable,
// we could skip it.
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String doctorName,
    required String location,
    required String appointmentDate,
    required String appointmentTime,
    String? appointmentPackage,
    String? bookingId,
  }) = _Booking;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Booking._();

  /// Converts a JSON [Map] into a [Booking] instance
  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
