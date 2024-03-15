import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

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
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'numberOfNotifications')
  int? numberOfNotifications;

  CustomerResponse(this.id, this.name, this.numberOfNotifications);

  // from json

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // to json

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: 'phone')
  int? phone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'link')
  int? link;

  ContactsResponse(this.phone, this.email, this.link);

  // from json

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  // to json

  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthentecationResponse extends BaseResponse {
  @JsonKey(name: 'customer')
  CustomerResponse? customer;

  @JsonKey(name: 'contacts')
  ContactsResponse? contacts;

  AuthentecationResponse(this.customer, this.contacts);

  // from json

  factory AuthentecationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthentecationResponseFromJson(json);

  // to json

  Map<String, dynamic> toJson() => _$AuthentecationResponseToJson(this);
}
// to auto create  from json and to json .. in terminal run this command "dart run build_runner build --delete-conflicting-outputs "



