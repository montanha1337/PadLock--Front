// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      name: json['nome'] as String,
      fullName: json['fullNome'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'fullNome': instance.fullName,
      'nome': instance.name,
      'code': instance.code,
    };
