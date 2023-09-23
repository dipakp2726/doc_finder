// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Package _$$_PackageFromJson(Map<String, dynamic> json) => _$_Package(
      duration:
          (json['duration'] as List<dynamic>).map((e) => e as String).toList(),
      package:
          (json['package'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PackageToJson(_$_Package instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'package': instance.package,
    };
