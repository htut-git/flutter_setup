import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int user_id;
  String name;
  String customer_id;
  User(this.user_id, this.name, this.customer_id);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
