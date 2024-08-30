// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_job_shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserJobShiftModelImpl _$$UserJobShiftModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserJobShiftModelImpl(
      id: json['pk'] as String? ?? '',
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
      startDateTime: _$JsonConverterFromJson<String, DateTime>(
          json['startDateTime'], const DateTimeConverter().fromJson),
      endDateTime: _$JsonConverterFromJson<String, DateTime>(
          json['endDateTime'], const DateTimeConverter().fromJson),
      authorizedPersonName: json['authorizedPersonName'] as String? ?? '',
      job: json['job'] == null
          ? JobModel.empty
          : JobModel.fromJson(json['job'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserJobShiftModelImplToJson(
        _$UserJobShiftModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.id,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
      'startDateTime': _$JsonConverterToJson<String, DateTime>(
          instance.startDateTime, const DateTimeConverter().toJson),
      'endDateTime': _$JsonConverterToJson<String, DateTime>(
          instance.endDateTime, const DateTimeConverter().toJson),
      'authorizedPersonName': instance.authorizedPersonName,
      'job': instance.job,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
