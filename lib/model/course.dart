import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  String? id;
  String? name;

  Course(this.id , this.name);

  factory Course.fromJson(Map<String,dynamic> json) => _$CourseFromJson(json);

  Map<String,dynamic> toJson() => _$CourseToJson(this);

}