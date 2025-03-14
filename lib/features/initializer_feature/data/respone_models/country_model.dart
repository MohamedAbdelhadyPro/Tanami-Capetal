import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  const CountryModel({
    this.id,
    this.iso,
    this.isoName,
    this.name,
    this.flag,
  });

  final String? id;
  final String? iso;
  final String? isoName;
  final String? name;
  final String? flag;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        iso: json["iso"],
        isoName: json["iso_name"],
        name: json["name"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso": iso,
        "iso_name": isoName,
        "name": name,
        "flag": flag,
      };

  @override
  List<Object?> get props => [id, iso, isoName, name, flag];
}
