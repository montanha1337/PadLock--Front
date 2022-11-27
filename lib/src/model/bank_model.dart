import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable()
class BankModel {
  @JsonKey(name: 'fullNome')
  final String fullName;
  @JsonKey(name: 'nome')
  final String name;
  final String? code;

  const BankModel({
    required this.name,
    required this.fullName,
    required this.code,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}
