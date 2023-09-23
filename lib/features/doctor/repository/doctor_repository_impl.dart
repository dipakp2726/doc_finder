import 'package:docfinder/core/core.dart';
import 'package:docfinder/features/doctor/model/model.dart';
import 'package:docfinder/features/doctor/repository/doctor_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorRepositoryImpl extends DoctorRepository {
  DoctorRepositoryImpl({required this.httpService});

  final HttpService httpService;

  @override
  String get path => 'doctor-appointment/';

  @override
  Future<List<Booking>> getAllBooking() async {
    final res = await httpService.get(
      '$path/appointments',
    );

    return List<Booking>.from(
      (res as List).map((e) => Booking.fromJson(e as Map<String, dynamic>)),
    );
  }

  @override
  Future<Booking> getBookingConfirmation() async {
    final res = await httpService.get(
      '$path/booking_confirmation',
    );

    return Booking.fromJson(res as Map<String, dynamic>);
  }

  @override
  Future<List<Doctor>> getDoctorDetails() async {
    final res = await httpService.get(
      '$path/doctors',
    );

    return List<Doctor>.from(
      (res as List).map((e) => Doctor.fromJson(e as Map<String, dynamic>)),
    );
  }

  @override
  Future<Package> getPackages() async {
    final res = await httpService.get(
      '$path/appointment_options',
    );
    return Package.fromJson(res as Map<String, dynamic>);
  }
}

///
/// provider for [DoctorRepository]
///
final doctorRepositoryProvider = Provider<DoctorRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);

  return DoctorRepositoryImpl(httpService: httpService);
});
