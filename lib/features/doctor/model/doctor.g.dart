// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      doctorName: json['doctor_name'] as String,
      image: json['image'] as String,
      location: json['location'] as String,
      speciality: json['speciality'] as String,
      patientsServed: json['patients_served'] as int,
      yearsOfExperience: json['years_of_experience'] as int,
      rating: (json['rating'] as num).toDouble(),
      numberOfReviews: json['number_of_reviews'] as int,
      availability: (json['availability'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'doctor_name': instance.doctorName,
      'image': instance.image,
      'location': instance.location,
      'speciality': instance.speciality,
      'patients_served': instance.patientsServed,
      'years_of_experience': instance.yearsOfExperience,
      'rating': instance.rating,
      'number_of_reviews': instance.numberOfReviews,
      'availability': instance.availability,
    };
