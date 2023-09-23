// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookingState {
  String? get bookingDate => throw _privateConstructorUsedError;
  String? get bookingTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res, BookingState>;
  @useResult
  $Res call({String? bookingDate, String? bookingTime});
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingDate = freezed,
    Object? bookingTime = freezed,
  }) {
    return _then(_value.copyWith(
      bookingDate: freezed == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingTime: freezed == bookingTime
          ? _value.bookingTime
          : bookingTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingStateCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$_BookingStateCopyWith(
          _$_BookingState value, $Res Function(_$_BookingState) then) =
      __$$_BookingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? bookingDate, String? bookingTime});
}

/// @nodoc
class __$$_BookingStateCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$_BookingState>
    implements _$$_BookingStateCopyWith<$Res> {
  __$$_BookingStateCopyWithImpl(
      _$_BookingState _value, $Res Function(_$_BookingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingDate = freezed,
    Object? bookingTime = freezed,
  }) {
    return _then(_$_BookingState(
      bookingDate: freezed == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingTime: freezed == bookingTime
          ? _value.bookingTime
          : bookingTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BookingState extends _BookingState {
  const _$_BookingState({this.bookingDate, this.bookingTime}) : super._();

  @override
  final String? bookingDate;
  @override
  final String? bookingTime;

  @override
  String toString() {
    return 'BookingState(bookingDate: $bookingDate, bookingTime: $bookingTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingState &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.bookingTime, bookingTime) ||
                other.bookingTime == bookingTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookingDate, bookingTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingStateCopyWith<_$_BookingState> get copyWith =>
      __$$_BookingStateCopyWithImpl<_$_BookingState>(this, _$identity);
}

abstract class _BookingState extends BookingState {
  const factory _BookingState(
      {final String? bookingDate, final String? bookingTime}) = _$_BookingState;
  const _BookingState._() : super._();

  @override
  String? get bookingDate;
  @override
  String? get bookingTime;
  @override
  @JsonKey(ignore: true)
  _$$_BookingStateCopyWith<_$_BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}
