import 'package:json_annotation/json_annotation.dart';
import 'package:pix/src/model/pix_model.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  @JsonKey(name: 'Nome')
  final String name;

  const ContactModel({
    required this.name,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
