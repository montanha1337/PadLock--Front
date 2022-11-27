// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_pix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsPixModel _$ContactsPixModelFromJson(Map<String, dynamic> json) =>
    ContactsPixModel(
      name: json['Contato'] as String,
      listOfPix: (json['pix'] as List<dynamic>)
          .map((e) => ContactPixModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContactsPixModelToJson(ContactsPixModel instance) =>
    <String, dynamic>{
      'Contato': instance.name,
      'pix': instance.listOfPix,
    };
