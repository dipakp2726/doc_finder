import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `package.dart` with the code generated
// by freezed
part 'package.freezed.dart';
// optional: since our [Package] class is serialisable,
// we must add this line. but if [Package] was not serialisable,
// we could skip it.
part 'package.g.dart';

@freezed
class Package with _$Package {
  const factory Package({
    /// available duration
    required List<String> duration,

    /// available packages
    required List<String> package,
  }) = _Package;

  /// For custom getters and methods to work. Must not have any parameter.
  // ignore: unused_element
  const Package._();

  /// Converts a JSON [Map] into a [Package] instance
  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}
