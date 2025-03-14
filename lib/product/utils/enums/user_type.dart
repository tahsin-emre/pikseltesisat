import 'package:json_annotation/json_annotation.dart';

enum UserType {
  @JsonValue(0)
  none,
  @JsonValue(1)
  admin,
  @JsonValue(2)
  personal,
  @JsonValue(3)
  waiting,
  ;
}
