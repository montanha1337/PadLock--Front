import 'package:json_annotation/json_annotation.dart';
import "package:collection/collection.dart";
part 'pix_model.g.dart';

@JsonSerializable()
class PixModel {
  final String pix;
    @JsonKey(name: 'tipoPix')
  final String type;
  @JsonKey(name: 'banco')
  final String? bankName;



   PixModel({
    required this.pix,
    required this.type,
    required this.bankName,
  });



  factory PixModel.fromJson(Map<String, dynamic> json) =>
      _$PixModelFromJson(json);

  Map<String, dynamic> toJson() => _$PixModelToJson(this);
}
