// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  String get doctorName => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get appointmentDate => throw _privateConstructorUsedError;
  String get appointmentTime => throw _privateConstructorUsedError;
  String? get appointmentPackage => throw _privateConstructorUsedError;
  String? get bookingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call(
      {String doctorName,
      String location,
      String appointmentDate,
      String appointmentTime,
      String? appointmentPackage,
      String? bookingId});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorName = null,
    Object? location = null,
    Object? appointmentDate = null,
    Object? appointmentTime = null,
    Object? appointmentPackage = freezed,
    Object? bookingId = freezed,
  }) {
    return _then(_value.copyWith(
      doctorName: null == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentTime: null == appointmentTime
          ? _value.appointmentTime
          : appointmentTime // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentPackage: freezed == appointmentPackage
          ? _value.appointmentPackage
          : appointmentPackage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$_BookingCopyWith(
          _$_Booking value, $Res Function(_$_Booking) then) =
      __$$_BookingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String doctorName,
      String location,
      String appointmentDate,
      String appointmentTime,
      String? appointmentPackage,
      String? bookingId});
}

/// @nodoc
class __$$_BookingCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$_Booking>
    implements _$$_BookingCopyWith<$Res> {
  __$$_BookingCopyWithImpl(_$_Booking _value, $Res Function(_$_Booking) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorName = null,
    Object? location = null,
    Object? appointmentDate = null,
    Object? appointmentTime = null,
    Object? appointmentPackage = freezed,
    Object? bookingId = freezed,
  }) {
    return _then(_$_Booking(
      doctorName: null == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentTime: null == appointmentTime
          ? _value.appointmentTime
          : appointmentTime // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentPackage: freezed == appointmentPackage
          ? _value.appointmentPackage
          : appointmentPackage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Booking extends _Booking {
  const _$_Booking(
      {required this.doctorName,
      required this.location,
      required this.appointmentDate,
      required this.appointmentTime,
      this.appointmentPackage,
      this.bookingId})
      : super._();

  factory _$_Booking.fromJson(Map<String, dynamic> json) =>
      _$$_BookingFromJson(json);

  @override
  final String doctorName;
  @override
  final String location;
  @override
  final String appointmentDate;
  @override
  final String appointmentTime;
  @override
  final String? appointmentPackage;
  @override
  final String? bookingId;

  @override
  String toString() {
    return 'Booking(doctorName: $doctorName, location: $location, appointmentDate: $appointmentDate, appointmentTime: $appointmentTime, appointmentPackage: $appointmentPackage, bookingId: $bookingId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Booking &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentTime, appointmentTime) ||
                other.appointmentTime == appointmentTime) &&
            (identical(other.appointmentPackage, appointmentPackage) ||
                other.appointmentPackage == appointmentPackage) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, doctorName, location,
      appointmentDate, appointmentTime, appointmentPackage, bookingId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingCopyWith<_$_Booking> get copyWith =>
      __$$_BookingCopyWithImpl<_$_Booking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingToJson(
      this,
    );
  }
}

abstract class _Booking extends Booking {
  const factory _Booking(
      {required final String doctorName,
      required final String location,
      required final String appointmentDate,
      required final String appointmentTime,
      final String? appointmentPackage,
      final String? bookingId}) = _$_Booking;
  const _Booking._() : super._();

  factory _Booking.fromJson(Map<String, dynamic> json) = _$_Booking.fromJson;

  @override
  String get doctorName;
  @override
  String get location;
  @override
  String get appointmentDate;
  @override
  String get appointmentTime;
  @override
  String? get appointmentPackage;
  @override
  String? get bookingId;
  @override
  @JsonKey(ignore: true)
  _$$_BookingCopyWith<_$_Booking> get copyWith =>
      throw _privateConstructorUsedError;
}
