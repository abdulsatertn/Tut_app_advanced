import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: 'id')
  String? status;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'numberOfNotifications')
  int? numberOfNotifications;
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: 'phone')
  int? phone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'link')
  int? link;
}

class AuthentecationResponse extends BaseResponse {
  @JsonKey(name: 'customer')
  CustomerResponse? customer;

  @JsonKey(name: 'contacts')
  ContactsResponse? contacts;
}
