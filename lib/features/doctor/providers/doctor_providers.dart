import 'package:docfinder/features/doctor/model/model.dart';
import 'package:docfinder/features/doctor/repository/doctor_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'doctor_providers.g.dart';

///
/// provides list of doctors
///
@Riverpod(keepAlive: true)
FutureOr<List<Doctor>> doctorList(DoctorListRef ref) =>
    ref.watch(doctorRepositoryProvider).getDoctorDetails();

///
/// provides available packages
///
@riverpod
FutureOr<Package> getPackages(GetPackagesRef ref) =>
    ref.watch(doctorRepositoryProvider).getPackages();

///
/// provides all bookings
///
@riverpod
FutureOr<List<Booking>> getBookings(GetBookingsRef ref) =>
    ref.watch(doctorRepositoryProvider).getAllBooking();

///
/// get confirmation for booking
///
@riverpod
FutureOr<Booking> bookingConfirmation(BookingConfirmationRef ref) =>
    ref.watch(doctorRepositoryProvider).getBookingConfirmation();

@riverpod
Doctor doctorByName(DoctorByNameRef ref, {required String doctorName}) {
  final doctor = ref.watch(doctorListProvider).value;

  return doctor!.singleWhere((element) => element.doctorName == doctorName);
}

///
/// current doctor provider
/// override at run time to use
///
@riverpod
Doctor currentDoctor(CurrentDoctorRef ref) {
  throw UnimplementedError();
}
