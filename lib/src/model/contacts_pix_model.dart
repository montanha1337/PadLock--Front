import 'package:json_annotation/json_annotation.dart';
import 'package:pix/src/model/contact_pix_model.dart';
import 'package:pix/src/model/pix_model.dart';

part 'contacts_pix_model.g.dart';

@JsonSerializable()
class ContactsPixModel {
  @JsonKey(name: 'Contato')
  final String name;
  @JsonKey(name: 'pix')
  final List<ContactPixModel> listOfPix;

  const ContactsPixModel({
    required this.name,
    required this.listOfPix,
  });

  factory ContactsPixModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsPixModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsPixModelToJson(this);
}
