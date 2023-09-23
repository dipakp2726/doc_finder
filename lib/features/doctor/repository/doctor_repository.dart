import 'package:docfinder/features/doctor/model/booking.dart';
import 'package:docfinder/features/doctor/model/doctor.dart';
import 'package:docfinder/features/doctor/model/package.dart';

/// {@template doctor_repository}
/// doctor_repository Description
/// {@endtemplate}
abstract class DoctorRepository {
  /// {@macro doctor_repository}
  const DoctorRepository();

  /// base endpoint for doctor appoint ment
  String get path;

  ///  get Doctor Details and Available Slots
  Future<List<Doctor>> getDoctorDetails();

  /// List of Packages API
  Future<Package> getPackages();

  /// get confirmation for booking
  Future<Booking> getBookingConfirmation();

  /// get all current booking
  Future<List<Booking>> getAllBooking();
}
