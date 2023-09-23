// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Booking _$$_BookingFromJson(Map<String, dynamic> json) => _$_Booking(
      doctorName: json['doctor_name'] as String,
      location: json['location'] as String,
      appointmentDate: json['appointment_date'] as String,
      appointmentTime: json['appointment_time'] as String,
      appointmentPackage: json['appointment_package'] as String?,
      bookingId: json['booking_id'] as String?,
    );

Map<String, dynamic> _$$_BookingToJson(_$_Booking instance) =>
    <String, dynamic>{
      'doctor_name': instance.doctorName,
      'location': instance.location,
      'appointment_date': instance.appointmentDate,
      'appointment_time': instance.appointmentTime,
      'appointment_package': instance.appointmentPackage,
      'booking_id': instance.bookingId,
    };
