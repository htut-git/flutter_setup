// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['user_id'] as int,
      json['name'] as String,
      json['customer_id'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'customer_id': instance.customer_id,
    };
