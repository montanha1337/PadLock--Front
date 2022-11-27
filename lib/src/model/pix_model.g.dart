// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixModel _$PixModelFromJson(Map<String, dynamic> json) => PixModel(
      pix: json['pix'] as String,
      type: json['tipoPix'] as String,
      bankName: json['banco'] as String?,
    );

Map<String, dynamic> _$PixModelToJson(PixModel instance) => <String, dynamic>{
      'pix': instance.pix,
      'tipoPix': instance.type,
      'banco': instance.bankName,
    };
