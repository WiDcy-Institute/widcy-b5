
import 'package:json_annotation/json_annotation.dart';

part 'faculty.g.dart';

@JsonSerializable()
class Faculty {
  String? id;
  String? name;

  Faculty(this.id, this.name);

  factory Faculty.fromJson(Map<String,dynamic> json) => _$FacultyFromJson(json);

  Map<String,dynamic> toJson() => _$FacultyToJson(this);
}