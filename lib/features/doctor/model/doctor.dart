import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `doctor.dart` with the code generated
// by freezed
part 'doctor.freezed.dart';
// optional: since our [Doctor] class is serialisable,
// we must add this line. but if [Doctor] was not serialisable,
// we could skip it.
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    /// name
    required String doctorName,

    /// image
    required String image,

    /// location
    required String location,

    /// speciality
    required String speciality,

    /// number of patients serverd
    required int patientsServed,

    /// years of
    required int yearsOfExperience,

    /// rating
    required double rating,

    /// number of reviews
    required int numberOfReviews,

    /// date and time of avaialibity
    required Map<String, List<String>> availability,
  }) = _Doctor;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Doctor._();

  /// Converts a JSON [Map] into a [Doctor] instance
  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}
