import 'package:json_annotation/json_annotation.dart';
import "package:collection/collection.dart";
part 'contact_pix_model.g.dart';

@JsonSerializable()
class ContactPixModel {
  final String pix;
    @JsonKey(name: 'tipo')
  final String type;
  



   ContactPixModel({
    required this.pix,
    required this.type,
  });



  factory ContactPixModel.fromJson(Map<String, dynamic> json) =>
      _$ContactPixModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPixModelToJson(this);
}
