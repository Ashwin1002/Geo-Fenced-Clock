// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobModelImpl _$$JobModelImplFromJson(Map<String, dynamic> json) =>
    _$JobModelImpl(
      jobId: json['pk'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      location: json['location'] as String? ?? '',
      contactPerson: json['contactPerson'] as String? ?? '',
      numberOfWorker: (json['numberOfWorker'] as num?)?.toInt() ?? 0,
      startDateTime: _$JsonConverterFromJson<String, DateTime>(
          json['startDateTime'], const DateTimeConverter().fromJson),
      isClaimed: json['isClaimed'] as bool? ?? false,
      endDateTime: _$JsonConverterFromJson<String, DateTime>(
          json['endDateTime'], const DateTimeConverter().fromJson),
      claimedNumber: (json['claimedNumber'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$JobModelImplToJson(_$JobModelImpl instance) =>
    <String, dynamic>{
      'pk': instance.jobId,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'contactPerson': instance.contactPerson,
      'numberOfWorker': instance.numberOfWorker,
      'startDateTime': _$JsonConverterToJson<String, DateTime>(
          instance.startDateTime, const DateTimeConverter().toJson),
      'isClaimed': instance.isClaimed,
      'endDateTime': _$JsonConverterToJson<String, DateTime>(
          instance.endDateTime, const DateTimeConverter().toJson),
      'claimedNumber': instance.claimedNumber,
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
