// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_job_break_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserJobBreakModelImpl _$$UserJobBreakModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserJobBreakModelImpl(
      id: json['pk'] as String? ?? '',
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
      breakIn: _$JsonConverterFromJson<String, DateTime>(
          json['breakIn'], const DateTimeConverter().fromJson),
      breakOut: _$JsonConverterFromJson<String, DateTime>(
          json['breakOut'], const DateTimeConverter().fromJson),
      job: json['job'] == null
          ? JobModel.empty
          : JobModel.fromJson(json['job'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserJobBreakModelImplToJson(
        _$UserJobBreakModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.id,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
      'breakIn': _$JsonConverterToJson<String, DateTime>(
          instance.breakIn, const DateTimeConverter().toJson),
      'breakOut': _$JsonConverterToJson<String, DateTime>(
          instance.breakOut, const DateTimeConverter().toJson),
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
